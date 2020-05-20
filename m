Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424BE1DB85B
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 17:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbgETPeh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 11:34:37 -0400
Received: from mout.web.de ([212.227.17.11]:41535 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726560AbgETPeh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 11:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1589988871;
        bh=c/iA4Qw0mwjTc4Kbdxey5SPatIu0dcNYT/jLW+VInK0=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=HJybk5y2BVr1L1zrj+bcZN8/qjdhSX1je+sxcZgaZ978TyakyBB2qbd7J9RQUJQIk
         hII3TEIjd6TdLaYeZ7MW10syP90wa05tDVlwIvVlzYc5j/LRH0asGBiKbQ4lgw6/Rw
         rBiEcizuGXuXrfX1/63G2I6eD/CoUE5EKkDh6EE0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.152.26]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MBCBN-1jiszq2kUv-00ACKX; Wed, 20
 May 2020 17:34:31 +0200
Cc:     linux-kernel@vger.kernel.org, Harini Katakam <harinik@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: cadence: Add error handling for a
 platform_get_irq() call in cdns_i2c_probe()
To:     Dejin Zheng <zhengdejin5@gmail.com>, linux-i2c@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d1e26bf4-9317-b28a-ed87-8e1eddbca99e@web.de>
Date:   Wed, 20 May 2020 17:34:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Odk7DzmNbt481GQY2/BdYc3XXWxsfXHIdpHTnhqBDhYXK1c1vlr
 Flh38Vh3SqfnJJ2rHQsuy1Q7h8w3fRRJ65ko9yFB6gC+UlKlVt77yMFRwqViWNE1ZnS+4l3
 1v3v5cJuqAW24JDw6KmBzxli6pop6qGFnBVnjTYYwFYysradTItYDx6AREzkaTK6ugP/vsm
 be0ydFZq70ZMRlunk0KMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hk+/lnBEXsg=:xrgwWfTTkM0Dze8T3LpdzU
 037QETd320vSuA9vqNeZsgm1cV4xCXxCHhJRRK0Wa6Qk1xM4mZ4CWeniVpPeA6a3n3eGakS2d
 v/DRaYP/tRWk3QP0mhMsyDe+t0HBERS/8/usL0Z7ORk0YcBL7WvOnFU59VR4cAOSDZVkUmql0
 vOueuhjFAJk+QylCYaHgxhTURIZd77IdC5xA5afX/xjloifgWbpyRdaXmIpH66E7bSUc3HpfK
 VQnJxponjj+EljsUhV7tAedy0xtNn6whQXsFkOWHr08AF5QaTqvbkE3H6NJlcDmGoyf6UhS6P
 OZM5vYoqPJ7SllGm5fBn3B8JK5fIlxfqnke4t7y7/Ws6yvc2WGlDwT8LanRyvdL9c//TRtc+F
 6g6FLrqRwO7mZkTtytgYCFFdck6Cq80Rr0CTLZtILIDkD5QyO5jTpfuVS+d/kUq9WKGsVZWrS
 0BBvx4wzTwkk2SQggFSEY1AO3Exp50gFIZhJrviPV4vGvuDrm+LFWJvwgT2x7PUWxgP1s2h/E
 7P15JMHZCMakJ8tZQCKnS58aVUuVK62Gr5bK9Z13ydCQpmIC8OubEvDbDNPA7OmMJA85fWDGk
 Er4zr6GnOIpm9lZPe2iS5n3oFyeP/NCd/Mgv58WECQ03cFUHCjR2E6p/wkO+K7TBkn/60dhAn
 BK3hbpXURxwEmnq5RR8ale4L0xvyzF6cZcpjnDjryAsweJtLWD+x6UsF5aw/dMfUnOP/V45F2
 oSuTvZJAjcBQPFliBT4Ld4wowqrwkBTVzHycQ2998f9wWjwbq1xV3bQljqmPltBlr8w7nzre8
 6h3M4itaViZg2zdPjbZY1nAhFF1g7BKueFQAzKoY/f7SHdc6EgWyVcuipzdhdumkh4kqv/XPk
 8KB43NSGsTidBxXtI++bxjhqNvxBuowgLTr6jHx26LqMQN32GxDVNEnvVYM/3KGJGw31Phpuc
 r7PHRDw6eCQWC7KlcIxnvqv4KboU++KxsCwjSDH3/jhy4BvSx3IrFvie2fUoNH8CWOGcz2bmP
 38BYroGJw//SRI+DGqAe4T8LeFr/Pi8GCo6p8yBgwMkWQSWfrthmXHp72qWW7N4b+QzqRb1lz
 a2KXvqv2gQ0oY5gb5ec7iAfrFjqe/+vQpxBDRCQ4H5wZFbvhawAGWiTl4t2LWvsv4kn6Lahsb
 3/D1uCRnj/qYdEGyQNW3eSeV3pm8Ouey64EwebkkZM7QwRyr6q23DCQAMuabhSGldxR6Q4Ey3
 HRpGZkSDdZNsb+NWD
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> The driver initialization should be end immediately after found
> the platform_get_irq() function return an error.

I recommend to improve also this change description.
How do you think about a wording variant like the following?

   Return an error code after a call of the function =E2=80=9Cplatform_get=
_irq=E2=80=9D failed.


Regards,
Markus
