Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929931F88AD
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jun 2020 14:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgFNMIa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Jun 2020 08:08:30 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:34248 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725815AbgFNMI3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Jun 2020 08:08:29 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Sun, 14 Jun 2020 20:08:03
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.65]
Date:   Sun, 14 Jun 2020 20:08:03 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Wolfram Sang" <wsa@kernel.org>
Cc:     kjlu@umn.edu, "Markus Elfring" <Markus.Elfring@web.de>,
        "Dong Aisheng" <aisheng.dong@nxp.com>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        "Fugang Duan" <fugang.duan@nxp.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] [v3] i2c: imx-lpi2c: Fix runtime PM imbalance on
 error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200614091203.GC2878@kunai>
References: <20200601061640.27632-1-dinghao.liu@zju.edu.cn>
 <20200614091203.GC2878@kunai>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <72b721eb.10d6ff.172b2bac1e9.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgAXblAjE+Zed9xNAQ--.27067W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgULBlZdtOohcwAAsN
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbtvS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVACI402YVCY1x02628vn2kIc2xKxwCS07vE7I0Y64k_MIAIbVCY02Avz4vE14
        v_Xr1lV2xY6xkI7II2jI8vz4vEwIxGrwCS07vE42xK82IY6x8ErcxFaVAv8VW8uw4UJr1U
        MIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lV2xY6I8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14v26r106r1rMIAIbVC2zVAF1VAY17CE14v2
        6r1q6r43MIAIbVCI42IY6xIIjxv20xvE14v26r1j6r1xMIAIbVCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lV2xY6IIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIAIbVCI42IY
        6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUU==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiAKPiBDYW4geW91IHBvaW50IG1lIHRvIGEgZGlzY3Vzc2lvbiB3aGVyZSBpdCB3YXMgZGVjaWRl
ZCB0aGF0IHRoaXMgaXMgYQo+IHByb3BlciBmaXg/IEknZCB0aGluayB3ZSByYXRoZXIgc2hvdWxk
IGZpeCBwbV9ydW50aW1lX2dldF9zeW5jKCkgYnV0Cj4gbWF5YmUgdGhlcmUgYXJlIHRlY2huaWNh
bCByZWFzb25zIGFnYWluc3QgaXQuCj4gCgpUaGVyZSBpcyBhIGRpc2N1c3Npb24gaGVyZToKaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNS8yMC8xMTAwCgpUaGVyZSBhcmUgbWFueSB1c2UgY2Fz
ZXMgdGhhdCBzdXBwb3NlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSB3aWxsIGFsd2F5cwppbmNyZW1l
bnQgdGhlIHVzYWdlIGNvdW50ZXIgYW5kIGRvIG5vdCBjaGVjayBpdHMgcmV0dXJuIHZhbHVlLiBT
byBJIGRvbid0CnRoaW5rIHdlIHNob3VsZCBhZGp1c3QgdGhpcyBmdW5jdGlvbiBkaXJlY3RseS4K
CkFzIGZvciB0aGlzIEFQSSwgRGFuIHN1Z2dlc3RlZCBhIHJlcGxhY2VtZW50ICh3cmFwcGVyKSBm
b3IgbGF0ZXIgZGV2ZWxvcGVycy4KSSB0aGluayB0aGlzIGlzIHRoZSBiZXN0IHNvbHV0aW9uLgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTI0NTM3NS8KClJlZ2FyZHMs
CkRpbmdoYW8=
