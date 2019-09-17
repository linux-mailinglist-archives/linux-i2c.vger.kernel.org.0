Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72B4B517D
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 17:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbfIQP2x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 11:28:53 -0400
Received: from mout.web.de ([212.227.15.4]:42221 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfIQP2x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Sep 2019 11:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1568734128;
        bh=G9TZSNUKLdrLpEHYKM5LRzFW5y+Z1TzgCmUc7szZ38s=;
        h=X-UI-Sender-Class:Cc:References:Subject:To:From:Date:In-Reply-To;
        b=nVsqzSWvDmJklYkevMU/FNdNsT031pWNpy8/nQ9q+c3062199qCN9kYlg6fjg6zEv
         2zyUwf3MkvwjRkeG3WyadP9KWYZlnxGubWlepJSGu3EKZdvYWskMokxWIs58MXiixl
         4ENPmefOSq9SL1Mj56+JIGbFADn+bdJIsCGxmyJY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.93.51]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LoYJu-1hi28D3orK-00gVB5; Tue, 17
 Sep 2019 17:28:48 +0200
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20190916185857.GA14093@SD>
Subject: Re: [PATCH 2/3] i2c: qup: Remove dev_err() log after
 platform_get_irq*() failure
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f25a406d-9032-5db9-7136-6ff99c02f888@web.de>
Date:   Tue, 17 Sep 2019 17:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916185857.GA14093@SD>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FEiVmc3Rc3Ggh7bg9KUwsXvV9ejxmkgrXq0nDh3yCmsEv8RQ8Fj
 GRd8fNlRCT60C1RWhXN4/pFdccCpDMXxsqV4F8iJTP2VsXiYREzZTNIKvCcJI1g2ykdp3m4
 Vkt+Rona2elFWTY5lgOOri4hmeYkti4qPSWJfdsAlLEGPXQs8M4YL8mTLQjbzHN9bfTVCuq
 KG5w9cbud37cT3wz1w+2w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PIAgitQJ8YM=:cq2AElC0onpwHQ9SOTFp5L
 YhGNrGLNsm5nSRi8ypVTXXqO6XV8BniDX9TZLTvdbZCQQlcoaSIe3kT4rBqKw7PPMRygKlWm1
 jzaDU4eGJfNkulo2HmgtxWNOxegffTdqNxOQT7PQPcJouN28voOrTC7D9kY7NV9kkwpJVFoW+
 Dwd/kbYTY1ZYMcaZmb+lGCnfQ6x7K2t4Xf9NDlDgcABvGg8XPusV6SyB2xuSQuWEo8BOT6nL6
 1JhwHS/XNianbOzTpVzID3JJfo3DZTwwKi0CNFk/VPCV5zvGQmTrP4F7KCX4vVBfdb0UU3GeX
 XtMCoGkVtvnB+gmmcwCjrEuHXeRJLJY7m9yxC97vGCEd93V7OUT+ZxcynkiRDxgBKl0/gu+Re
 cV6c7rSivZLnYg5kQvQ7LSMQZzRCiDwLUvIEA2lR6VYtE6KijO1Nw8x+Q72lP7DkqRVVEkHNK
 wRjHsfI4cycPJ5pHuReNICAwOWi9Y8rgJhlD55hVuBmM73dh2/Wr2Vzzyo2WJayZQDs3eCQBT
 PQZyZeENjKMsG1U3jbGiKHRB+2TS+uNWBBdDEFc0jqLdczsoZo1pm+sHkNZGkxvJZ+87ZHkr3
 bu7LuTnKrEPj81Br6hJ1vuz2cLsXJ8iaOBaWPCg091Xf/F5tip5EsqHuNOWjrj2XiTJcdo+af
 /xua2xh1yC2nTC6nN4Xz/eSlDSL+bMVYyVydD98q0kEWaDM/g8oRD6kw9mNOBA1t0Hrh+pttj
 PLvy3jB3Jf2XgRXphMeUOnqO43e0YkF4QfQMHTczKcOV7L4WSIhxJMsKKJmxE//rxyWMonMeh
 pV5DU8MhGW3CC6ajB914n7jr419sH54YLZOWEvBU4IWAcRWPTQUwEJAbP6z2SZm1t9+qNuKI+
 CPGTLPW4/OSGtcWj6tEHEWI7OXOm0pI7q5qH7l26dDCws6MscJpnK+a8R0Hc6urr7xy3jSA8W
 iwTulTO0lYrj3rUsbaW/3L+Bo1UxIkrUgUOUDGTyQGXGwr1r1ELhXc4GLUys5qXmtHhrp+Wsg
 FAUi7c9amaaDT/+TKVWEqyU4fUTSVQz8ILsNFwWRuri7mnEOr9c3GWCR1W/XO8C6C58m/eWwh
 n68ke7zKr/0GQ/IofdkKmuUKdx+Wx3v+Ym65p82vK5ZRpa27lSTJj09UZbHYlAQFN3gofVnXS
 E6HbYKViRJqOj6OtmxMngmSfQ/paz6kwD1M5H5YyUBWnZjwnIuIXEqlBHVA3mt37Jlfi65rlQ
 Q6q+VArUEFDDwZ0enZYTW/p+b6LABv6PJ9LNhV7xEJRicmz3K8uZ277kGyuk=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> The semantic patch that makes this report is available
> in scripts/coccinelle/api/platform_get_irq.cocci.
>
> Found using - http://coccinelle.lip6.fr/

Can a tag like =E2=80=9CGenerated by: scripts/coccinelle/api/platform_get_=
irq.cocci=E2=80=9D
be more helpful than the other description variant?


> +++ b/drivers/i2c/busses/i2c-qup.c
> @@ -1767,7 +1767,6 @@ static int qup_i2c_probe(struct platform_device *p=
dev)
>
>  	qup->irq =3D platform_get_irq(pdev, 0);
>  	if (qup->irq < 0) {
> -		dev_err(qup->dev, "No IRQ defined\n");
>  		return qup->irq;
>  	}

How do you think about to omit the curly brackets here after only a single
statement would be used in the if branch?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3Dad062195731bea1624ce7160e79e0fcd=
aa25c1b5#n175

Regards,
Markus
