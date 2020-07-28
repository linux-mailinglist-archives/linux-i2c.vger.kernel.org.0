Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451C8230A8D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 14:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgG1Mqq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 08:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729562AbgG1Mqp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jul 2020 08:46:45 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5799C061794
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 05:46:45 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id p3so11827199pgh.3
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jul 2020 05:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DlEJNyclCCPKb5vftkHXgwlgV0wVVaZUu6XqjFfXhac=;
        b=DF8BQFehYK+rcVQ2YqOJ/T7Vh2Y75ylPoerMYUwRkBOgzFSSqB41LlSncAIle92Wf2
         CAKE2ChxjQ7LQD1ZB20PpBgRaos9YubwBFil9YXtsU7R3POi5M1DIj/YbJFAuGFPMdt8
         K3tOeKrn75W4rU2xvCXa/qPNO4k2dA2+t9MLrcCmqW5DNthGTlZN/EEx8uqQlEi9TZgz
         CrsBMscFfiFUWPzGAD+yZFn3y7ewTzeSkhk4R+Pws3W4AWy1wR83fV7xsLqRFKZFLSfz
         3GWmmuh7zYdcjmdNMpWQCknHyg0PwbzLApDAWXhygfOp8lgvNSwb57bXjnaI+gtf+AmL
         7VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=DlEJNyclCCPKb5vftkHXgwlgV0wVVaZUu6XqjFfXhac=;
        b=pFxKL6yb/P+AO4D5fRBfVUYFlPLyT3ITuklMxoayk+lPCT9+KcXVv7u4q2haqFE2MS
         CneFjNHUdDq86/Q4VovEZ8z1OR6nu+v6X4pajqc0nUnrD2dCPMcHIOUrlbHR+WR1JMp6
         Nu+DKUPe8sLk22X+3SYWcKffEoc867QtP3qp/P+8sspRvPcbNoit0sKvsPK4lxDeVQdA
         Lnf3KE5H/SvUNxH6Okz8xEEe60WIqqqbsSgal6FhAiVNmD8wvtpoS7j3MT28BMCF9LBn
         dQSeKG0PcIIG34VuEchOdb1+kiNPTxCwMDy2jjTTuZXfZDcaNYZ8xV+vQn2PBPT8u4kv
         FQoA==
X-Gm-Message-State: AOAM531N9yZsp+gNjfRHHBs4wdmObEVZAVSVlh+svGQXCt2SR6RlhmG8
        3Xpb3WXkPMQ6SxK4WbAeiKQ=
X-Google-Smtp-Source: ABdhPJxqsM3gJ2j0xWbWaAsScMrMrnHWDVtMzCWvE/o67losPV4/hwzXO+Klp/ZKcVy1yoXSHQY/pg==
X-Received: by 2002:a63:df56:: with SMTP id h22mr23859996pgj.140.1595940405196;
        Tue, 28 Jul 2020 05:46:45 -0700 (PDT)
Received: from [192.168.173.154] (76-10-188-40.dsl.teksavvy.com. [76.10.188.40])
        by smtp.gmail.com with ESMTPSA id m6sm8045154pfk.36.2020.07.28.05.46.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 05:46:44 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
From:   Daniel Stodden <daniel.stodden@gmail.com>
In-Reply-To: <14454F49-740B-4423-A2F9-4B00B18A9A74@gmail.com>
Date:   Tue, 28 Jul 2020 05:46:42 -0700
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD3AE432-8D30-4116-A5A0-3538F674F466@gmail.com>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
 <20200728111602.GC980@ninjato>
 <14454F49-740B-4423-A2F9-4B00B18A9A74@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> On Jul 28, 2020, at 4:40 AM, Daniel Stodden <daniel.stodden@gmail.com> =
wrote:
>=20
> =E2=80=9C3=E2=80=9D ;)

Sorry, I got confused. You=E2=80=99re suggesting to label the old calls =
=E2=80=9C2=E2=80=9D and
the new ones take the original name.

That=E2=80=99s fine! But we need to figure out what we really require, =
and which
protocol to prefer.

 * If the new block size can be too large for small clients with Smbus < =
3
   slaves, we=E2=80=99re not going to deprecate those.

   But phasing out 32 byte transfers for good would make a simpler =
header.

 * If some clients need the old calls and make a new i2c_smbusX_data,
   then those aren=E2=80=99t /* deprecated */ any more.

   With the above scheme, we're making i2c_smbus_data size 255 and
   and rename the old type to smbus2.

Btw: I think I was confused because would have called those i2c_smbus1_ =
then.

Best,
Daniel=
