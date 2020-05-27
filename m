Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D521E4D34
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 20:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgE0Spj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 14:45:39 -0400
Received: from mout.web.de ([212.227.17.12]:38909 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE0SpZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 14:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590605111;
        bh=Dwiv4seL8ee3C/JloOJp8AqoZ3iVO2A78wPGNVrFh6Q=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=MM2fWHAR3Kha899mJdTt3UE4stnKaxhUfxD3+5ECVoj3+QAgfezDTrabzyGcxuho1
         e7x/+RFeon0lpSG3fs8BUw3ktFfXpoX+B0uV9KMGlxd6fjZId+9Z1BGpvl1AZ3B3AS
         hhhDPhl3pMQ3mhN2s9L+AhFRaSnRwnqgGh9G3SJI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.185.253]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LcxtU-1jDRix2jfE-00i9OS; Wed, 27
 May 2020 20:45:11 +0200
To:     Dejin Zheng <zhengdejin5@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 1/2] drivers: provide devm_platform_request_irq()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5dad9b19-ceb5-1606-9f62-7626e5677971@web.de>
Date:   Wed, 27 May 2020 20:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2mj89pThrO5GlS0CuVGiU9ZLPcTx8lPGvbGv8BYFG1BSUlD3T48
 6UxnmAH94iiqCfJgLpFqv9ZXEPz+X7s/E0ry0T/NLYq6TT1hGK4lT3zGnS9ytwUdzTPLan2
 IIokIi748DcsofVx0uoAIxyxQY3y56Ba+N7erEXQ59gbK3Ly60xLL7KMgJmumcDGP2npA4g
 zuiMsEpyVtCeSBKBFr3GA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:43Ak3plJJvE=:qbo1+TuYzsjw3ssPkjMjWE
 G5ri/P32z6g8UxQ0Nn6aBdRlQZEmgfWXykldoUDLCLfck/80fLHgs/ku/++b8JFioV2//zkb6
 fp5YbzJlaSOkJ7igXrGz0GEbClz2wo9j6ai2hCUsKSjegVJPe2+SjqlWOIc/mx30/sec21OSL
 nDoMnsL2TDgwGT1W3hlePv3sRDPzHu6L3mhdERBn2HK8n4y9+OjpqtNPOdknBpG7UrX8sKCSx
 ZmhwNGYnpFOgU3VHR+Bhp71Z8kMMOUmrDvxXqlGukkL1q7C13NPA/j3bwSwd4/avEeV0EWZjh
 S6vHKgFcs0ZQCbY4IXf6xvztCcgsRuHoCa5L9o1tC6Mt3w5CWBxiwJ4FEj/5vAd1F11KHhdT6
 +W5SMdniYdpmnl2etH8WO/a8yXdkfAASBFdKzoE4UqSTpWBNKMq6xLBS88BeRfYM8J81C829T
 +rSCm36sBQtQNkNxVelwHDZSMSa2f+Y2y1zJcf1/bM/rDwMFZu//inkksgTmX4hU8LIDTuR+O
 TqVAaCIb/f6e7kPR01Z2BPMNSCEIP3zYcFWB0AGgdnXSTwsZVbHPPWown6SMHMaHzdx8g9WBR
 aCII5GmjInO946ukSGPW7iK9r1+R52fwC0uHyquJtGbCWnmOfEvtbRvRdi5j5C9gU36088pUO
 llWtTwOVI3aOY2rBnFcLOAE8iFvzv02QQ3TPfwegrJRwZt9kfhPmP+iz18CldzQwtwP+xw+Nm
 dCARGoZ7YRgynJqaMok7UyJIPIkmY1I+sZiojbBqNimLhSi4SB/aR9kMgkvM22zQYBxaZoyKN
 frFgjUiksQ4g9keCpEzot9eMRq5zHXHfk0aZ+4/sR0xgdX04btYcdyLjFQWgB1N5KR8v58fD8
 lPnJZV8UFcUo1giftKQiofnRJ5i78grntwkTk6aGsqFdckR1VHeLBPkN2UvtJDsIbwSz2rEhR
 y5P/e3xLNfBXjRF9Y1tK902Y+DQqVXszxXwOAG3GNPpVJJgkNscJewpFqTBKw4D08PdmAz2dW
 dazxLNUfzwTzsJLbBWk3wOHC0qmwYEmCTRlXXOuh8h74jhgZWPMGMH7rZ/X7fbr5Zxb5I+zuz
 T5EIT9gdZob8bGA3mIPQgXEwWXct31yng+79Eosj98D/obP9MedAweIKdjMCZjnPkhBJX3fkL
 CuDAlioEl72JLhZFT8HZeoMr7ZK/traZPbrTmGXMeB/PBqJKCSMVcGXd8hckY1gdBK3Q8Q7j5
 MW7osp6pF5VfzQH5O
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.

I recommend to improve also this change description.
How do you think about a wording variant like the following?

   The function =E2=80=9Cdevm_request_irq=E2=80=9D is called after the
   function =E2=80=9Cplatform_get_irq=E2=80=9D in many drivers.
   The exception handling is incomplete there sometimes.
   Thus add a corresponding wrapper function for the simplification
   of the drivers.


Will a companion script for the semantic patch language (Coccinelle softwa=
re)
become helpful for further support of collateral evolution?

Regards,
Markus
