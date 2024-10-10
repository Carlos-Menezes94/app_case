# App Case

O projeto foi criado utilizando as boas práticas de programação do Clean Architecture, adotando o Repository Design Pattern, seguindo alguns princípios do S.O.L.I.D para promover código modular, de fácil manutenção e escalável. A aplicação busca separar as responsabilidades e reduzir o acoplamento entre as camadas do sistema, garantindo que o código seja mais fácil de testar, manter e receber novas features.

## Estrutura do Projeto
- **Testes**: Na pasta /test e /integration_test contém os testes de unidade e de integração da aplicação.

- **UI**: Contém a lógica da interface do usuário, gerenciada com **ValueNotifier** para controle de estados simples e responsividade. 

- **Domain**: As interfaces e contratos que definem as regras de negócio da aplicação, garantindo uma alta coesão e baixo acoplamento.

- **Data**: Implementação das interfaces/contratos da camada de domínio, sendo responsável por obter e armazenar dados. 

- **Core**: Funcionalidades genéricas e compartilhadas entre as outras camadas do projeto, configurações globais e classes auxiliares.

## Bibliotecas Utilizadas

- **get_it**: Utilizado para injeção de dependência, garantindo o desacoplamento entre as diferentes camadas da aplicação.

- **flutter_screenutil**: Ferramenta utilizada para garantir a responsividade da UI, ajustando elementos de acordo com o tamanho da tela do dispositivo.

- **lottie**: Usado para adicionar animações dinâmicas.

- **ValueNotifier**: Utilizado para gerenciamento de estado, facilitando a atualização da UI sem a complexidade de gerenciadores de estado mais pesados, e ainda é nativo do próprio Flutter.

- **loading_animation_widget**: Usado para criação de animação para estado de loading.

- **flutter_secure_storage**: Para armazenar dados em armazenamento seguro, como o token do usuário. 

- **dio**: Usado para realizar requisições HTTP.

## Testes

Foram realizados testes unitários e de integração para garantir o funcionamento correto das principais funcionalidades.

