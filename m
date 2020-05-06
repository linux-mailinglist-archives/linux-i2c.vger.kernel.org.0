Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B731C73AC
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 17:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgEFPMk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 11:12:40 -0400
Received: from mout.web.de ([212.227.17.12]:35243 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728991AbgEFPMk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 11:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1588777951;
        bh=0vnNfdzJ/+OWZAUbbv1VGEHAn+XpJdc7Movwb/kchIE=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=TKAlvhn2Slsp9eCiEUJrhH6dEnR2SATBKNjxuBNPLeHEbWZ0LR35v9/TyFy/b/r/m
         rYeuI2koe9y1n/oqvlBS/rbhR2F4YgKayi1EalwZU/GfZj2EiCsyxJSZiGDpSRLlq9
         A7ayYqyz2MVFykDSy+JwaBapqNnLh/+tLQwq0TFY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.162.166]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mrfp8-1ikw5S3mCa-00njRL; Wed, 06
 May 2020 17:12:31 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Guan Xuetao <gxt@pku.edu.cn>
Subject: Re: [PATCH] i2c: puv3: Fix an error handling path in puv3_i2c_probe()
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
        linux-i2c@vger.kernel.org
Message-ID: <dbdba794-a6d5-0f37-a675-389681b03c34@web.de>
Date:   Wed, 6 May 2020 17:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ul9Wt4bi9vTI+Xdpp6hNw8iF0jYpvI946iI07Uyo0yQn1u7eUM
 WBX/f9iHYrz3y8aUVA0tRgWtCGS/UCFX69gSoUnKWBV5ha/c+Xn6KVLr5gRPpbmMbVYymah
 XTHhcoVf9hFw7XVuDIGWAMViIuOSi6nTeUGXeFFCBqKP2ha3xPiDt1bkLBh1fDP5kwqfuor
 BMgM/EIXEO8Tt3XarfWNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UKhtddFYyaY=:l9cblQXDdoNFN/P9WToy95
 RMsIi2Drvz9BDN7Ab9XX/NS8XgWXKRZT7lN/dcyE+Czb/x7+OKRXESUVjw5M9wNgcJWB6Ev+Y
 mBFRC1URmjmIWem2/cK6Pkp+rXpgcjdTCLxBjDuINpCjLiSyUYQ4HFz1NKeyBlyUlmODs1FjT
 dRG7o8M4d7jgq3gBRLO9/eQbdcNEYwxIdd6xTsNR3WMfGL29jXFOnau0okYXx8cO4J3O9Hovs
 wl5ACzFvK7RuKIUIMEUjBYSbTssJ+rDT96fqx6B9+Loz9RJj++nAUTEvlY0rS4DWj4SETjJOu
 gbddurAF4VEWEHAHdaV0sfAfJ/+gNJ0YM+1nGrlr/BbV+Gs3hWfCPkkrprVklrq8b+ehv+6kd
 T0zexFGFemKOEkj/KlsmCADeii46BnCrXJ5fDGvwt6SvhNys25pecgHrk/bnzRosMkLaowtvo
 C/sqshCd8urg5mNq29x4PXJge3b/z+hx5CH0CzTM6I5fnuknTPXdhhk+qcMZYa2z0QzqgdNsP
 oroE5Z8NB0nCUnWvNDR//I7qI1NXKrwDu91LJPa86fnQV2mNeMg7k93wPfeazwbAZhTmWsvkb
 dZjPddPlyRQRui3BkXInmj+0WAOcfnTRXF8ptPwxIuPpUyZGi8yGYzPkNmIKKblEw3UFCa9zS
 stcMSSoyFGlhbLp3itJMQbJHaLJ9sq+bev4wmCv6H+IIVBjp0453cPF3RJ6vVJxyWmUlRLbNb
 nZXbg/fpXVERXvN9ETnFbGjt++JoHGWSegOI1RQRr660Ce0I8AOInBnjBXXX6lTUrUyPzzmZF
 iSNT2uDzd96QnGXIcGdNSQ5vyL71Yq1C0zhjCzRK3P5cC6cpX5vPwojJcrE0QMUc+X05E6LyE
 e5MzqwkFgVs54jNmuvN8NBk9C6cOWRZuwTU9bbUJisHJcbje6IJudQ2zEOUkEMAXcyFLVkziv
 7EQWrKMV9YeAuogPch2co0N8zufmmH3g0sx+lefEwgj1bPxNiJnuMzeqL+LR+gMYLi1s+v53g
 CBmtF1W+rjvPnVAkHhMtpQX2frllQpJKb6pBoznpNeq1GsFrosoucLWGGDwZnyXHkSMoPWEm6
 RU0/yjOSKfS9kEhpBt53GiS7IxIywFSzadEzQcRk3QGz0syLchDPs8GoGClP83erhaMUf9K2n
 Sh7qifpF6aupSg+fbCwGppUgPjdBkD/j2bFBX1kvTN9C0vymksvK9iizD3jyOQ9TYESB8ki1h
 a16pJAyY2yPutt1fS
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> There is a spurious 'put_device()' in the remove function.

Do you find differences in the clean-up of system resources suspicious
between the implementations of the functions =E2=80=9Cpuv3_i2c_remove=E2=
=80=9D and =E2=80=9Cpuv3_i2c_probe=E2=80=9D?

Regards,
Markus
