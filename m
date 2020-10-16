Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37CF28FEE2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 09:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394545AbgJPHIb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 03:08:31 -0400
Received: from sonic301-20.consmr.mail.ir2.yahoo.com ([77.238.176.97]:43840
        "EHLO sonic301-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394541AbgJPHIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 03:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602832108; bh=wR5lVjnikrCWdBMGP/xssUebnOUv8VnwoTVQxurwr1A=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ImPV5tDQnghgfVM424xq4qlre2sbIhj+OLuRxM/0jgqA3axY4Uk2quycmbCDDQ5LJTrHH1OnKzUI15j8evFQt8GNOJ2Gr1K7q7zvy9y4xHWvpwt0pVntPG4+T8x76D/kUV6rVvLStbT9DgNgdpAygv3l2+fKA8Zx9WdVKiIKA6geUUMB+vqx/MmVkFHF0DtReK1QZIQ7ImYfbyRlLKU3bA7ss5Qh+z5EK5OolgnAn1/XvSE+T7cchulFfL4snr/e6ydFSpkF2uSpEA5IlGWGElCjc+6nxiNL7y/it5NIsSTuLm3h3+e3oMH44vODcJLbgP59KIEUUzMZIpURpRocXw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602832108; bh=T3qWoBmutFbdMcAfvDGL4q125j8PSkf6OFk+cG678sP=; h=Date:From:Subject; b=poj35Oof8+idIrZfjsiOIKE14++rg2Lnql2cNg6shAUQ0i7bbjy5d6nRIWkY6ntsHgGz7PUiUWQ5rnQrSzPKVzw25y6ovvLK56QjACMLZrxw4jrHUM1y3Y7sz3N2pPOWcVChIIkOSaTHApWcUvqyQXytXo3IgcJi5PiWJsG/3h0WRk9wkK2oS69YhE/pOKQPROAyvRtxeNelHj+Tc5h1A1LXMZKUH1DOch9YncZpypwmz4a+DNm0YLuIHv8et+wOd4Aaq4gt3KcFqZj7A4QO6u2D2KCjuV4w+IGB57ay4LYL6XsvwphCgf7plTiYw6QWnlOrGIq/vGW8xq1Utx7QQQ==
X-YMail-OSG: 3QP4YeYVM1lzX.rCQNU47iQAFJvpytnVsf6uoW95ga72c2pkV3rcWEoYk7WbAZz
 N42RR5U1xBybXM1W4uWj3MddVipKsrTrOlgzUdhrXIoN9tKi7eD.zEwocDHAKRdM8nc.MZ.YahNk
 OXlsD5JsTYeY9Q.KgMPTytbW1NSn.HpRioY4u47JbKCZeQHF8vmi2q0LF2d66FEWB7bq6XIamFuX
 VxICYqRNXRgXRCjbVR4Y4zOTLMxYd9Cpzu7JoCHuCtvy8S_HLKQvTBviiSjrSkM4Ac1Xjlb6SdcQ
 0fjSLU70dTkP8bAmxzOxgrAH4qtOr.8eCgJ5IPGE3SRtSS4G725nNIuAhLxTlTCKljDq1Sum12Lo
 s3JpqcORXdqAA_NUU_n3T1XZ9qhYlL22XdhL2jpJopuSygBrbHHc5hEtEAV2vhjMHbqpE7gKpOsz
 wX3UwRmw9pbbYM2RDQZZeJJ2h.LYAmhjp2sOTqPOhiwG1gSFeMaW6dliTGr7LTbzkiGjfBdnpkeb
 _ZRMQerh4geg_KhJ_r3nTNBV0ogoeL6Qj.GQ.NdqDRQizu06_MpNVBUGjt5HTDaLFk9OujohnZiA
 6KmodUjtAfX6m.0eFSV1xi4FGFMCspABiPme8bTfdrEblSOVdfS7_JHl8Nxy4zZZsT9WK5GSbH7N
 u9Qr61.onMceZJRYQOXAlMZPXU1kNpcHzdqfThpV65HvtiOOZm0IbVcUfzlHxGtPFp.NYOnnmEek
 UkMsHClhLpk7tfHDz.2c88PMHm0Kwwc5OiiuSmFSBOvDI7RRpnsiJVq5INgWmdrHx8QaQgnUVmH_
 0eydNY2XgofxGAJL2sgS.lY25DT__DPGTvzzNK3v1hLsreqpEr88KVI6EFm8gO1CeXLnbWKsVBDt
 VZc_W7DmSiPasp_bAVcPcrmxGad42HUnepNDTeSmzY_Qe_M7EIanT1LilB2T1ZtktqKNictXgq..
 63Gqo6AmB7wX3yJJmjzpyt8bZdLR2fKSnVRuIBufVZdat1mBGV9U9w_tr.YRHGxaI6pMcuKPQtGT
 2vN2ZvMXvIE5N8hur_sum9S9fO5SiJg.Bdzs2ZyTq.mhFREIp0urKbcY8oNms_MrbBqfFs9aDWnu
 .VJ6WEWGSWEqWLgEDndSzuDERMtaljzRd2J5MC2TLrl8LwHcFGcJLD50rATZE3mSGbAa68nmvEhq
 _oaxlAaB7hj5yttT1cRa6i1ill_cdCdFeIEaPC0cq4QoXsQw6FjCCbP.cfXLaM.f7zh8vldltdSS
 eJDMyphamzAawp7_vkyDN9GKH601QWSZP0fUrr6LlROyhXW.ee5_rMT5ib7SdIJ3kFZuBMX.StcH
 KDIO8tXPuUBVo8rSYHxZA9d98UPEcfvzmC7d46hhhDzNxvvtoumDs5gUOwzcoVIqNAOutY_lSZxi
 xu8ziSy4IoreA_vRtOVOEKPRRPk9WiClArfF2xU2CgKZp
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ir2.yahoo.com with HTTP; Fri, 16 Oct 2020 07:08:28 +0000
Date:   Fri, 16 Oct 2020 07:08:27 +0000 (UTC)
From:   komi zongo <komizongo2016@gmail.com>
Reply-To: komizongo2020@gmail.com
Message-ID: <2132579339.56190.1602832107459@mail.yahoo.com>
Subject: Very Very Urgent.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2132579339.56190.1602832107459.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16868 YMailNodin Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


My Dear Friend

Before I introduce myself, I wish to inform you that this letter is not a hoax mail and I urge you to treat it serious. This letter must , come to you as a big surprise, but I believe it is only a day that people meet and become great friends and business partners.

Please I want you to read this letter very carefully and I must apologize for barging this message into your mail box without any formal introduction due to the urgency and confidentiality of this business and I know that this message will come to you as a surprise.

 Please, this is not a joke and I will not like you to joke with it OK, With due respect to your person and much sincerity of purpose, I make this contact with you as I believe that you can be of great assistance, to me. My name is Mr. Komi Zongo,, from Burkina Faso, West Africa. I work in Bank here as telex manager, please see this as a confidential message and do not reveal it to another person, and let me know whether you can be of assistance regarding my proposal below because it is top secret.

I am about to retire from active Banking service to start a new life , but I am skeptical to reveal this particular secret to a stranger. You must assure me that everything will be handled confidentially because we are not going to suffer again in life. It has been 10 years now that most of the greedy African Politicians used our bank to launder, money overseas through the help of their Political advisers.

Most of the funds which they transferred out of the shores of Africa were gold
and oil money that was supposed to have been used to develop the continent. Their Political advisers always inflated the amounts before transferring to foreign accounts, so I also used the opportunity to divert part of the funds hence I am aware that there is no official trace of how much was transferred as all the accounts used for such transfers were being closed after transfer.

I acted as the Bank Officer to most of the politicians and when I discovered that they were using me to succeed in their greedy act; I also cleaned some of their banking records from the Bank files and no one cared to ask me because the money was too much for them to control, They laundered over $5billion Dollars during the process. Before I send this message to you, I have already diverted ($10.5million Dollars) to an escrow account belonging to no one in the bank.

The bank is anxious now to know who the beneficiary to the funds is because they have made a lot of profits with the funds. It is more than Eight years now and most of the politicians are no longer using our bank to transfer funds overseas. The ($10.5million Dollars) has been laying waste in our bank and I don't want to retire from the bank without transferring the funds to a foreign account to enable me share the proceeds with the receiver (a foreigner).

The money will be shared 60% for me and 40% for you. There is no one coming to ask you about the funds because I secured everything. I only want you to assist me by providing a reliable bank account where the funds can be transferred. You are not to face any difficulties or legal implications as I am going to handle the transfer personally. If you are capable of receiving the funds, do let me know immediately to enable me give you a detailed information on what to do.

For me, I have not stolen the money from anyone because the other people that took the whole money did not face any problems. This is my chance to grab my own life opportunity but you must keep the details of the funds secret to avoid any leakages as no one in the bank knows about my plans.

 Please get back to me if you are interested and capable to handle this project, I shall intimate you on what to do when I hear from your confirmation and acceptance. If you are capable of being my trusted associate,do declare your consent to me, I am looking forward to hear from you immediately for further information,

Thanks with my best regards.
Mr. Komi Zongo,
Bank Telex Manager
Burkina Faso/Ouagadougou
