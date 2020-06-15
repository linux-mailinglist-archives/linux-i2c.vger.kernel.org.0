Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EB61F9026
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jun 2020 09:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgFOHly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Jun 2020 03:41:54 -0400
Received: from mout.web.de ([212.227.15.4]:36859 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728496AbgFOHll (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 15 Jun 2020 03:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592206866;
        bh=bItkEfVhTtW3qhNuAqeugRekO6eOCtuOduTADC0Dxpo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Zr9HGQbqrU9fyeP4eO2ZtJrBxH8XaC0ynw0tq5V0+wzIpUJiXLRbt1y2LYOa8ei4b
         iS9HAJ7mN4kR9zTAJ1ubULFO6wsLGMtofBN0a56KNo8CTdRMPaFjdB8jGj8SoPhcbO
         qWwKneuMOCgFwl8ZifRNCyt/xJyU/L9IiFfxHQ1k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.107.236]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MSrll-1jIzl12fBd-00RtLL; Mon, 15
 Jun 2020 09:41:06 +0200
Subject: Re: [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on error
To:     Wolfram Sang <wsa@kernel.org>, linux-pm@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Aisheng Dong <aisheng.dong@nxp.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Duan <fugang.duan@nxp.com>, linux-kernel@vger.kernel.org,
        Qiushi Wu <wu000273@umn.edu>,
        Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Aditya Pakki <pakki001@umn.edu>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
 <20200614091203.GC2878@kunai>
 <AM6PR04MB4966A1FD80A29BA1E63247C0809C0@AM6PR04MB4966.eurprd04.prod.outlook.com>
 <20200615070613.GA1497@kunai>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <44768ceb-ee7c-85f2-6091-ec6bcd06ab54@web.de>
Date:   Mon, 15 Jun 2020 09:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615070613.GA1497@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FuBQm1DRSSkCYJ2edMYXZR4IvGdroKwuuv04BLF5yUfFgHJ/mn+
 yD3jvW29OaoGTyGy+53Tb9VbJash4lZqCw/HNyfKTmEhtIMhsEa2PSDwhiRlg5s8AI/2+nL
 LHwX1OD/k456WCZgpwcSRhM1lEugbwyYhKb0PTP6t4axS2GwVFWXBU8U19jyMoK0fnOEQU5
 kdeP64TlrD8QanCbAxDzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NXiTrW/1b1M=:SgG+2iWLn8ElTNhwZuZrBS
 UY0H5Nti9xLwHfPHxBLBETlP4WJaBb2K1Qr3Pq4y0aWz7N+OSgtzmwEO2q2Pvj+YDSsyErOHB
 qQmiS1V0hHuRKfbLnDqsf6BcM3j0zbxbqPBRh08xgrmYRfNenVGT5t3HsZt1r+0PaNgB1rErp
 SaHjxuT8L/TBYbTbnDfa5LoBPRrW3jK/1SI1xPMtOnfP+jbXTbFZ052Ce48QunlB3ycJWVAI9
 Tze+LsWZrTokMSEWjZzpkE+rrqyGZcUg9UBz66Nj26P9fHFUy/gPIGgWP2R1eAnrhqzkDgZyc
 GZgeSepUsLYp5ZXoj1d2+BRda645LYU121Txcljw0aRMDlPMvkTfxIWBRzs+lu9zizVkYSvqb
 9+8dStG6yFFvxLeySVFeQ284wMc+PLvZ1BSoJ4IPAt5wlvmJV53LnGemc9lPlvmnK8u7BClXd
 H69TX32QTlMz204B41n2JcrAqMaHr0H9MmRzhbSXOAriTGngBWJPKwsIN7fyrQ11WDChm4M4R
 I4VAnLS5Yk5og4hKGKd8NhmgqgwHRWDEs1WNwuxRxhBvcWSl9xDhTTzmsc2c6XjMYDJ/AW981
 +1oVOZZhr7uoGl8+XM/SrSc3jgJP9lafyz5dE+8aCXzOmQCiIh6qc3nGGFuaLpsMK587eO0qD
 Pne/t1wE1i1Icj7BHC/dNLiPSrKMQjG2nkTyNktD6DXmDLFnt9NBC5/DvFwX10rgaJztL0sDD
 Bo9fJQd2+1JhC0TsK7L8HexjTsAz7mHBxxUGxHRCjtEo20RlAcQD8kOEawedMjoYvGWqFHsFT
 jabT3Ow1yqv9IigwZoALXEPgVAOGZex6zrl/7nG7AQMSxgJd/aSCwnZaEDAqziF1qrMVZsPuH
 nfxc3yvja1BjPnYn+1yfOmMh8nZaAaQd3VBf+tkj9wA9aWSjnNb4iwUNBVnrB/DG/Neyjiqhv
 /NnTnTZoLEPE+Fg3tDpHA0gPmgXlF0lT6bUCMo9J29V1OfqIAy3RiTeVZFnAKOPsqU+hi78DV
 s64Pge9GWzxa88PE9EguTO0W9J9cevmUH+4i+E2zfY2QNfas2JmoXOD2wXOtLyQQJuOL/Tqzt
 iviJsFj+UQD9e89/nNXE2Tzefg6AnxVvfIbfHW4EIheLFpds22Hjs8NOSlHnxJxLUfItQUxeh
 /y9U7MrigPyp3RCNX8Yd8hLLy5dIoRC8AoGZS5E2gz0qlX07SmLIQ5tRO3CjJe7T+FSAld5rW
 u8LEQM+KET53W+4m1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> I started a seperate thread:
>
> https://lkml.org/lkml/2020/6/14/76
>
> Still, on-going discussion if the proper fix is to remove the error chec=
k.

I find that a bit of additional information can make such a link safer.

RFC: a failing pm_runtime_get increases the refcnt?
https://lore.kernel.org/lkml/20200614090751.GA2878@kunai/

How will the clarification of corresponding software aspects evolve furthe=
r?

Regards,
Markus
