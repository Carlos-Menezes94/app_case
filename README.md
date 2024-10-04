# Projeto App Random Numbers

O projeto foi criado utilizando as boas práticas de programação do **Clean Architecture**, seguindo alguns princípios do **S.O.L.I.D** para promover código modular, de fácil manutenção e escalável. A aplicação busca separar as responsabilidades e reduzir o acoplamento entre as camadas do sistema, garantindo que o código seja mais fácil de testar, manter e receber novas features.

## Estrutura do Projeto

- **UI**: Contém a lógica da interface do usuário, gerenciada com **ValueNotifier** para controle de estados simples e responsividade. 

- **Domain**: As interfaces e contratos que definem as regras de negócio da aplicação, garantindo uma alta coesão e baixo acoplamento.

- **Data**: Implementação das interfaces/contratos da camada de domínio, sendo responsável por obter e armazenar dados.

- **Core**: Funcionalidades genéricas e compartilhadas entre as outras camadas do projeto, configurações globais e classes auxiliares.

## Bibliotecas Utilizadas

- **get_it**: Utilizado para injeção de dependência, garantindo o desacoplamento entre as diferentes camadas da aplicação.

- **flutter_screenutil**: Ferramenta utilizada para garantir a responsividade da UI, ajustando elementos de acordo com o tamanho da tela do dispositivo.

- **lottie**: Usado para adicionar animações dinâmicas.

- **ValueNotifier**: Utilizado para gerenciamento de estado, facilitando a atualização da UI sem a complexidade de gerenciadores de estado mais pesados, e ainda é nativo do próprio Flutter.

## Testes

Foram realizados testes unitários e de widgets para garantir o funcionamento correto das principais funcionalidades, focando nas seguintes áreas:

- **Repositories**: Testes unitários cobrindo as implementações dos repositórios na camada de dados.

- **Page**: Testes de widgets para validar a correta renderização dos estados da lista de números aleatórios.
