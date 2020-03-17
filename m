Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F73D18834B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 13:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgCQMLh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 08:11:37 -0400
Received: from sonic307-2.consmr.mail.ne1.yahoo.com ([66.163.190.121]:40939
        "EHLO sonic307-2.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgCQMLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Mar 2020 08:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1584447096; bh=kcevCRoll2+Bsa3FDERpIV72LVcB1A4YV1b5N2AWYBk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=GNqfjO2RF+Awy5YSepXh/s9YmsCdcubt4wpHexTEPR8CJG9d9Dd9fQqcoJkVT0ILu/Ku4bnvjoxkaCJaICKnJZQQYAxHWZ7sotW8i+gxuirPBN2ptC1mcN1LrgOwzgVoBT1LbBuY7v7uxoaWOPgBLlkONoCUyVJGE5TILKUam+G393XKkY/3Ypz295vJBwmv2d7GeGFFMl3YzzM1mYDeltTW6CZElVXbD6prQlxFhgPsWENclSoz3k5ZQ5gkvF2Kwa3X89e+X5XrPEXyrmnAeMeCahD7uL073TB4lQiga+VkQWlgoI0Z3Ueds0xvJrKjk6bM6wjzpfPP2ZCvaVaodQ==
X-YMail-OSG: MJW.iqcVM1kWbldJ6GaHhjTYpBQP4yD81p3D3IidKw2SRO_3qLxYTqc.7pX6QNZ
 KZsUkf3Xq5Wn8QiqH3Y5l2cER_tJNRjJCYyhWs5iq52D4N30ylC12N4FBcGDWCHUrUjoT_4WC1D3
 R1epjUUYntdj8Nk_he1A7q87btLbY_JiQyyXPczXpmon3.QXM8KYuXe9CzCl5eg7eE54pvWLb0ol
 rmPAfXrK3PcJQZKWEIF524qicNmU1luZkIS4DX6zog7EhmOOoBddGAbFl_q9Cd7qGg2mtzPlAN8O
 krUbQBmXcYPRd8XXD.PAhv.SEU5dHXIUtxin2OqxQl8YBNevAuGKZ.OmG5_VqFYp7xHrEK9RrZgn
 dh7oTrRZz5oRm0vAHPAW4FcPyRUVjERXY3i1egaBAGfxiwHwXI2xgQl9WvAW1apJZO4bwpRCQtsf
 gekm_am7zZMpMcUvARVjR0tRaMiv0OSQnUqztDykMX0nJpC98tjcmmYgCgXuLzrJWeS2XyvBgpEV
 tM4bDuRtQW2YoudCaPCiUpExOK328xpsikUY8_BXjtXPuIE.KY9KDd6VLZwC.A7h4zg3m6l0wzjx
 _TPJlAMNbWWg4PKKfQGss1lvY4cR0mfppMvAgqkl8NJfYQTW8ach82KNm39Jj6AZ2.mD48lUIr7q
 9mfCTGYLTQ1Gs5uoEGhyDM2KGa5t3Pb0bZzcikC8lebn.HkY4YOqIPZcy3iaNF0CZAHjT2.7djrl
 KlIcZtfDL012EoP9PIIx4g8Omfg9SXIM4WF5zgakilU_XwTKXJSUTQnRGVkekYgt4JlMbGDqKSF2
 ACtivPpvvLbGvbq6nGZM_mYduEMiUfErn373knAACltVmuEQ11gOTJYXVRb7xVdRMTMLZUct0RNR
 O5DNiJ4MOAOJoXGZj.mRXLIwIxZa9B5E0AYNA9iLk0zM12dJvcHqy5OKNfacDf0_iijcDsHzx3bF
 YOiCyiFLkfzxvXN3ca0OPkuyZBUc3d0PvF1zCE_ZGAmo7umXOKsvdiEeqCD.kYNQsClQxV0sEwG6
 59cX4KWhi.xXOHQ1BKZxe8ykEJ.JQXSFkdeH_sY7HFi8gfnjm5.EM0yDOSnZztywHj1gGaTtbhpM
 16QDWrYtCCes9cmPOkEbqNTaEQDdKImJhK_Lb4YsNsp0_qAi3Pvrd_0aYphPHpkxV8YrqtRmG9Cs
 J..NzyIxX5pN165pNiZm.qu9raTa0i2sUIWnrnN8K2QDNIWO1rFT4WlKwJFc_owm8NG2cGJrgaza
 NjiRhXaDepl1rKPFh5VjBgg9llZSttaL_jCtz7zaLeRajW1R2pSin.A6mUIm7flXsYULyJovhPVd
 ULJ0ULhINy_scPTyYMOs2Ibh4m8TRnzLP
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Tue, 17 Mar 2020 12:11:36 +0000
Date:   Tue, 17 Mar 2020 12:09:35 +0000 (UTC)
From:   Stephen Li <stenn6@gabg.net>
Reply-To: stephli947701@gmail.com
Message-ID: <518482929.1810933.1584446975070@mail.yahoo.com>
Subject: REF
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <518482929.1810933.1584446975070.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



Greetings,
I was searching through a local business directory when I found your
profile. I am Soliciting On-Behalf of my private client who is
interested in having a serious business investment in your country. If
you have a valid business, investment or project he can invest
back to me for more details. Your swift response is highly needed.
Sincerely
Stephen Li
Please response back to me with is my private email below for more details
stephli947701@gmail.com
