Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2987D1E9E63
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jun 2020 08:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgFAGmi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jun 2020 02:42:38 -0400
Received: from mout.web.de ([212.227.15.14]:42153 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgFAGmh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jun 2020 02:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1590993732;
        bh=tKOtouNpgU/IF7WGTYjqhR34wOq1MycJ9MCg4fP3yVs=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MxFsclfTklOvaRoBK4ZpfmjEsH4rKjNWoWg9GXNkRlGJniKXyx9X1r5W1f592aFb9
         hXKDwa7QpW0zAc/MDNzaWyi8uWwpw8gHwXuz0LuhEySP+STXPfg5xeRPvFj857fAoF
         6eBsxXuPulNtk4bP2TEV+SJlGYyGNtztaQM2JWfQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.133.32]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MK6mD-1jepCY3k1d-001O9T; Mon, 01
 Jun 2020 08:42:12 +0200
Subject: Re: [PATCH v3] i2c: imx-lpi2c: Fix runtime PM imbalance in
 lpi2c_imx_master_enable()
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Fugang Duan <fugang.duan@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <77448b13-9233-20a8-5e68-a8830314c27d@web.de>
Date:   Mon, 1 Jun 2020 08:42:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZkPZbkfzFinZrQLxVG6GTQz9drdW40WO6R+HEO+80m3z360YPLt
 lC2xGNp4QKSxUPFTqy+nMLUriY2fC4sBSmeJy2ucbJOe6exqWQ/2VJsgae/WKh6rkIibzJs
 bmLh3fZcvL6GdSgH6PkfdQlUl115g9YSGPYTVhiCuHHmQuPSQfJQV7xzWP/8y0ubf+LRUNV
 E2pyvcTsWtCfBazMOWWpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1rs281+F7ss=:HXxDFXERtaQu8mjySKm7So
 kNWGCJ9MoMLW/c2yQ9Ydm3XnCHV2tKbS23GI0TLLww8v8mY+1A1Q7FpBKkfLEQa7x6J3dzW9K
 pbNoKXJ1IKGEAmLT1CeaK9bnmko3JSLXQR2aYaZQ9FyPejtPZE79Z9/SDrAHlmteuAVymmPL6
 KC3vrygE3AwU6RZZYY6TFMHNCwmZzk+8cC2Y921AgrlIvHctZtX810ZhwS7xIWHZvQ9K0TKaM
 wAPkgA6SGMwWXu/WgVhhEsOUgfuKHS4Sdb6GLLXqk8PLruf5tTfhx6a1Rg9qls7r4ep2E71aM
 fhPC/ppKH4Ttv1ndehO9FGAW9uvDadrgELgl8X21BdOCyw1Yry+tQtxt97wYm7JGnAemzv5ux
 luEYmJVrP50TgAembUF3NRrWQLcn/L72ELc4FsUuudOC/PTFzIpSPbgBnWXfjgXMNpG0fMyDO
 R8l2hhWD31v36MXjuo0PS3XNa4vswgDn7gTPS2xsTqZ7V7/jcu228EOAvLjyeZJpcThETmk7n
 lDnOuzWFGquUgintiLkvJ7neKbDDRF/tDyZmLdXHu7cvogKByQMGQelgDffowsTRawELfkwKC
 CZL1ohvxUqT9GcngO0AtSTvXx1FNi4o39XB8ocSWPIoGTAYtO4HoznGXeN5mdy/ZUspQX7yrY
 mdgdD8HBiTQKlXxDhJXLB6d7PuKid0O9fPjZBTQPtZCnDkqIpgqWOzrCW0/WCgh7JTBFKOEQu
 /GUt5gxQPVE0PTrmYTahPvRIJQCycBSkxhR3VTF/IooRnl3La2+9kpXKrJdi6zvdgjNlIy246
 MdEe0Qg9+vxI79kYFXL6v/KIxxonl6vTKhZa0tQ4GR1NurH/DFutZjdMoSB6YPvLOhallPmLV
 DThl757gX2+54X2JZEa5kdqv3FE/f4iuQ+prl75qPBNMqD/jUmVwteYelklD80WGir8WH1O0o
 cxB17R2gT/EfZahPpCcxHrpdo5nTbY4IRCZZkkQ/i/CJah1nQNCpRbZArHxVdCDfxt8BwItab
 WzaFFN6CtcTaOzViQSAiE+Tc5806xu1LlG7BulgDmu5ogm74TbcQ1dyoLL980m/IbV8un575B
 KuoiIdPQq+Y5ovm0kU0ccNOJIlimy9Dr38oH4GsyHY9CIFWElHVAC0SshUPUHYF6jnH43d9rF
 2c7BkMROt404+HWQ+zaodEtXvAnP7ALIWhksIND8tLy0EcgbZ6/KkII6/C2B8jh9Bo6Z0x1/d
 Shgp55VP8CBBwGeKU
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a corresponding decrement is
> needed on the error handling path to keep the counter balanced.
>
> Fix this by adding the missed function call.

How do you think about a wording variant like the following?

   Change description:
   The PM runtime usage counter is incremented even if a call of
   the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D failed. Thus decreme=
nt it also
   in an error case so that the reference counting is kept consistent.


Regards,
Markus
