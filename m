Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FBF2949CB
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 10:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436655AbgJUI6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 04:58:00 -0400
Received: from sonic317-28.consmr.mail.bf2.yahoo.com ([74.6.129.83]:38125 "EHLO
        sonic317-28.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441197AbgJUI56 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Oct 2020 04:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603270677; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=d4rrYv3V2GJTucSzxHI0poqvECxQCuSKX4APhFt9rKN6EimvrunRxtGLPpmGC+3G31roWA41aYuzFEMmlKmf7P/Q0sUlg3s9Ou4mxrpF6l/0oxHJMCWPcGiH1NGPUxo3gUtGq/oYSF7/c2NG7eTiJ8mJGMCIjPIokhiWkGTauRhfVPH3vsF9tiHj0+pBy3nWIp+jMl7frUYpHR5p3xM+PZhYKvpgKSjcFoDwKOqStiLRPOMH2JuHA7ReBF9vDTZtpkIs7u6Xtp6BRjwsCKRPQGQh0BmSa6IDfEnfn4ekYCkUY7IdgDEwCkvk9M2hqZgUuXdcuKt24Uw1x4LxbKiWsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1603270677; bh=pUKPVXVUVqGBchhUwlgheIAjNXzldvseapb/CY56kLE=; h=Date:From:Subject; b=eMNdI2+afZpry5nL8TRuRk86ZlHYtwAsCIw82ymsAstPV0ytNjw0FxlbybpNHZHoY5qiTcucPrn2ZLMXTmcYjCUAAJAcHzRjZQmgFz7TaL0UBAE/HzD8ykDEjaD/d7LWHDxt3LP5X7XCSGHzIhZuIAP5IphSzgUO2gCmhX7BD2Hc6y0O32ennlncMC6YMPfVRRIanOeR9qRzcBxOy/hBT+jfwQYPxYzSjl2uM4e9Nqe2iQ03+Gr7yDiTDZc2zFdU5zq2nwLP6RCATI4q6KCD+l2sCOHdzT7MnmNjV83T43OzuOjxGBga4ZT3+WZkMARQGOdWyKPMdE6WFO5PhwT2xA==
X-YMail-OSG: 27O9dHMVM1l0v1zZCY7N17sxiCY0UJUNa3S9RO84G7Mxo2xEe5xYKLte4._DV_a
 eGb4t6ZaeisnE_wP4rHNd20rDmFadcIOz2ZRS4R1.WwbffWpez410aLx3Al0erAX.j6mdWIHv2x8
 4UsEM6conx3CapOGxAte_VV4u2NtrjvGggdFB6dWVERBtwaKEKm9tcGf2kgUD8Khr12r7IoaOEjf
 M9RcoclxMd30nFX5RTdyrQ2.Mq5HvgcfmDNbXb_JoHmSU_xpkcxX28bnTujlnk5.fYllEQ1YIpyK
 eDfob2o7GDp28zp8ZksAN7B0PlCla42pVz37ALxhu.bnGrgOxO8AZrCTNdfu6TKi_8sgF7qORPt4
 jWu0pbbcqQ0QtsQSO8oaI6TX_aqWNBpddQe8QX6tPxVTSEhOcK8dAaA3pf3bMhUqhIi9IJEBfq6B
 jn96vgCuxI6PsbWBlZj0odnEOSO8wUvUFiXzUtcK40UShkPxb8mD9OK3V.V25eKnqXQHw4FtUgrn
 MDkGU3yozvuJ86_r4zF8xkkOlLYqC4hWMxjMVlqG9KDoH.L.hG99yuMXSOAKFy51JPqInct0QQ0B
 bzdX3Bil1aKvhJUGay6lI5sWrd2jBkIwdkK3v2UBEO1l1rxUBAGlXHKlhoPlj0RiyFupyrSeV71U
 9rKIlINyoSsN4CqO3om6D0wlcIWXhJOdxsd6HEzrheqOdobW.fZNla16UCJeOhJdH2e6CVT0C7pS
 8Xh3P4yIxGtP86nUb8rgkl5F43cBBWNwseiHaM6lUD4Btw1UQBjucPXZmzVjXk_vvQ.qfCHuGd5D
 nHkNOdTYLbCwzLiwF_cLNVj3o8cgQwSF9HcFX2q4MbLWWGHQWpXmfZcGkK8Cn6AsUZzSesQMirR4
 gf4J1E3RdVGqDWhGhfx09EqE0DKy4ZQ6hGbn.9beBCoJWox3Q10vbxnmuCCSmXI70RPxMxBEyxYw
 cOP.Twy9EMlkbgLqTbroTh6FgeVMrP1YFIDaa6KhM0cAG.wPa5QN_vB2Qftig_WcPKYR5hB.Wlvr
 .EQNOCrguP24hZRm_QcCKwUIhwAC8vL02dWhwArYHkBqoHNm8h63A1u_DkTA5YU217FuWSxlED.X
 qzYz5fX6DEtf5MkSQaG8tuBXY56LS565QV9p3.6OkHpvYhwHniYIZXMou3Kdkfk3f7spzAS3cPNR
 YEc7pQoFWypS4F2YEiMM1G8T.Dw_rbTTX7D9A7ZCSDOJmBZFb3o11KA4gvoK6s6_ZkLK7wJj9qRW
 xxE7nSte3exUdyXjbFYtXFe.c1rqr1AtdIZki5CVddLxtza._UD5NzBaWGk6DyaXQuEW9C38ZgRm
 7FBE1rWUt3kAOjwB38shxtCYEjWinKcdOixPVZZoTIHnks.VwwsrehFjdZIXDbch1ndjTpZp7aQT
 wTTaRHtFUnyRU1P4cP6QoXxUFepUZIN3xL6OGUglLYbWs
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Wed, 21 Oct 2020 08:57:57 +0000
Date:   Wed, 21 Oct 2020 08:57:55 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <772581317.1319804.1603270675650@mail.yahoo.com>
Subject: YOUR CO-OPERATION FOR THIS BUSINESS (Ms Lisa Hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <772581317.1319804.1603270675650.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16868 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
