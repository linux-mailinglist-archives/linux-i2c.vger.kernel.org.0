Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437B94EC7BB
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 17:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343780AbiC3PGl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 11:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241476AbiC3PGj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 11:06:39 -0400
X-Greylist: delayed 471 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Mar 2022 08:04:50 PDT
Received: from zsmtp-out1.bppt.go.id (zsmtp-out1.bppt.go.id [103.224.137.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298808BF28;
        Wed, 30 Mar 2022 08:04:50 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTP id 9EB7A86CA7;
        Wed, 30 Mar 2022 21:56:40 +0700 (WIB)
Received: from zsmtp-out1.bppt.go.id ([127.0.0.1])
        by localhost (zsmtp-out1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id b74l4jZhvkEy; Wed, 30 Mar 2022 21:56:39 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTP id 1368186CAF;
        Wed, 30 Mar 2022 21:56:39 +0700 (WIB)
DKIM-Filter: OpenDKIM Filter v2.10.3 zsmtp-out1.bppt.go.id 1368186CAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bppt.go.id;
        s=selector; t=1648652199;
        bh=VyNFlD7/cu41Triwpcp5Awv70tSUbdDqwtfboErdO+g=;
        h=Date:From:Message-ID:MIME-Version;
        b=svAmnrrBHYNDdvp9KRdriEwM50eXaii7PA98Y0bUkFBdk1jAsN2JbFniYehHyrljh
         +C4l89xl6mPD3WldV6Bm2eXTIB9PPW6uJK9JslaS90zOLOXpiFgJ2MQxcOiD9I09jL
         3EUh9tmBzKGB//JGuvbkQ4dl592znsWxkV/Fx6Ww=
X-Amavis-Modified: Mail body modified (using disclaimer) -
        zsmtp-out1.bppt.go.id
X-Virus-Scanned: amavisd-new at bppt.go.id
Received: from zsmtp-out1.bppt.go.id ([127.0.0.1])
        by localhost (zsmtp-out1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id oo8HqgG1iuj0; Wed, 30 Mar 2022 21:56:38 +0700 (WIB)
Received: from mta1.bppt.go.id (mta1.bppt.go.id [10.10.180.6])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTPS id 03A3086C8D;
        Wed, 30 Mar 2022 21:56:36 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mta1.bppt.go.id (Postfix) with ESMTP id D8D41253B4;
        Wed, 30 Mar 2022 21:56:35 +0700 (WIB)
Received: from mta1.bppt.go.id ([127.0.0.1])
        by localhost (mta1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3ax2wUkxVRaB; Wed, 30 Mar 2022 21:56:35 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mta1.bppt.go.id (Postfix) with ESMTP id 510E325405;
        Wed, 30 Mar 2022 21:56:32 +0700 (WIB)
X-Virus-Scanned: amavisd-new at mta1.bppt.go.id
Received: from mta1.bppt.go.id ([127.0.0.1])
        by localhost (mta1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BUdznHRq4uXj; Wed, 30 Mar 2022 21:56:31 +0700 (WIB)
Received: from mbox2.bppt.go.id (mbox2.bppt.go.id [10.10.180.5])
        by mta1.bppt.go.id (Postfix) with ESMTP id 9F58924F4D;
        Wed, 30 Mar 2022 21:56:26 +0700 (WIB)
Date:   Wed, 30 Mar 2022 21:56:26 +0700 (WIB)
From:   Nadirah <nadirah@bppt.go.id>
Reply-To: huangjinping@winghang.info
Message-ID: <1605392657.4889796.1648652186596.JavaMail.zimbra@bppt.go.id>
Subject: Aw:Dringende Antwort erforderlich
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_4101 (zclient/8.8.15_GA_4101)
Thread-Index: Z5AUbGAGX1kurSPX/G7dIggd9c75xw==
Thread-Topic: Dringende Antwort erforderlich
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
        MISSING_HEADERS,REPLYTO_WITHOUT_TO_CC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



Es tut mir leid, dass ich Ihnen diese E-Mail, die in Ihrem Junk-Ordner eing=
egangen ist, als unerw=C3=BCnschte E-Mail gesendet habe. Ich hei=C3=9Fe Hua=
ng Jinping. Ich habe einen Gesch=C3=A4ftsvorschlag f=C3=BCr Sie. Ich wei=C3=
=9F, dass dieser Gesch=C3=A4ftsvorschlag f=C3=BCr Sie von Interesse sein w=
=C3=BCrde. F=C3=BCr weitere Informationen kontaktieren Sie mich bitte *****=
***************************************************************************=
**********#################################################################=
####################################
Isi e-mail ini mungkin bersifat rahasia dan penyalahgunaan, penyalinan, atau penyebaran dari e-mail ini dan semua attachment dari e-mail ini dilarang. Komunikasi internet tidak aman dan oleh karena itu Badan Pengkajian dan Penerapan Teknologi tidak menerima tanggung jawab hukum atas isi pesan ini atau untuk setiap kerusakan yang disebabkan oleh virus. Pendapat-pendapat yang diungkapkan di sini tidak selalu mewakili Badan Pengkajian dan Penerapan Teknologi.

