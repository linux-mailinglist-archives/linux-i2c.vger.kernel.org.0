Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138DB74BCC7
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jul 2023 10:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjGHIOC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jul 2023 04:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGHIOA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jul 2023 04:14:00 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688AEE46
        for <linux-i2c@vger.kernel.org>; Sat,  8 Jul 2023 01:13:59 -0700 (PDT)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02D941EC090B;
        Sat,  8 Jul 2023 10:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1688804037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:references;
        bh=dS2fzenyP0BX8ZJt91yKjyWhh0EsKLdU+FBzjXw+KV4=;
        b=AfceIfrPmKttzHI/QKHB9rWmUQtXwxo/NqGrxuueX93lMl0m216bpNg8HfZct44fSwJjVc
        tGKWe7U9W1/qYrqYrT/i3pxvUC9A6bRiT5j5DIxZgV3uuS4rAM+LbF095PlaR5EUlV3xO8
        dFYHdvcKb3MLEK7JWGuodH+YRDNesSA=
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
        header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
        by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id NESm3Vyn2Z52; Sat,  8 Jul 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
        t=1688804031; bh=dS2fzenyP0BX8ZJt91yKjyWhh0EsKLdU+FBzjXw+KV4=;
        h=Date:From:To:Cc:Subject:From;
        b=T65cEBe00oCandBMyP9jTx85ehUi6xq2E9KYAh8tTxl2N3EqHwIJLNLTBjeQB+kEq
         XT6TR4ZkPyktreOJ39R+B3zstt6Sj4yejW6yDM9ZAiddhXwsvlBWLH1AngkWZP2Qbs
         55jZFDBF95cyfhL02qfmj24H5VVGUCzIcZBlwJg2grCCir1h7Gv+U9a04krFvAY0aI
         elg96OC6Q9XjL7UU1FGxg54nS25WmyrFIeLsAW6T5MjuLLovtwKpTMvydH6JyrO6ub
         ocQ8zQmADy+u5tDgoVaIQlfMiMRJzZ42LDshE7S6FyD0grAmt/Mh773OKyLsBhXZGU
         MXOqp0Io5DHJUXmPkOJQj+rHCWaEDwUXUPtB7MZTSWgDPhrdaMAIS0xgm3rn5/hPBZ
         jsMO3iYzeR4gMIqb0hUupS65Ywx1EKqR6S8NAU/8P9Hj589LybaFHu/kyeTeVUumTn
         QDKmobgSb0jJvul98t7fWUw7LLJBJ2Jtk824h+H2tykiW850k1M0anqLXPQXs2MBK6
         GbTdqqP5juGCLXeVDtaCZHVl/uwNzlN0g6qJn4Rg/XoswKohv7Voma6+E1pNYcMz8C
         HHtzwrWIsK/4JGRirvFKjzFPUSvgj6Nbk9cZiwGwoyQYDNUl55jEJbG/D4Xy29hX1x
         dRGpzh5U5ayztxrSDJPDN8/4=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
        (No client certificate requested)
        by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B01AE40E0187;
        Sat,  8 Jul 2023 08:13:49 +0000 (UTC)
Date:   Sat, 8 Jul 2023 10:13:47 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     linux-i2c@vger.kernel.org
Cc:     paula@alumni.cse.ucsc.edu
Subject: [bugzilla-daemon@kernel.org: [Bug 217644] New: Chuwi Gemibook Pro
 Celeron N5100 touchpad not detected, PNP ID SYNA3602, i2c_designware
 timeout]
Message-ID: <20230708081347.GAZKkau6TqG8NjtOju@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Forwarding to i2c list

----- Forwarded message from bugzilla-daemon@kernel.org -----

Date: Sat, 08 Jul 2023 03:06:17 +0000
From: bugzilla-daemon@kernel.org
To: bp@alien8.de
Subject: [Bug 217644] New: Chuwi Gemibook Pro Celeron N5100 touchpad not detected, PNP ID SYNA3602, i2c_designware timeout
Message-ID: <bug-217644-6385@https.bugzilla.kernel.org/>

https://bugzilla.kernel.org/show_bug.cgi?id=217644

            Bug ID: 217644
           Summary: Chuwi Gemibook Pro Celeron N5100 touchpad not
                    detected, PNP ID SYNA3602, i2c_designware timeout
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: x86-64
          Assignee: platform_x86_64@kernel-bugs.osdl.org
          Reporter: paula@alumni.cse.ucsc.edu
        Regression: No

This bug is specific to the Chuwi Gemibook Pro Celeron N5100, 8GB DRAM model.
The bug is specific to linux as the touchpad works normally under Windows 10. I
have a J4125/16GB model of the same laptop and it works fine under linux, but
has a different touchpad pnp ID.

The kernel log error at the heart of the matter:

[21615.530254] i2c_designware i2c_designware.0: controller timed out

The i2c subsystem attempts to talk to the touchpad device and immediately times
out. This is a hard failure, no other errors ever occur. If I use i2cdetect on
bus 0, where the device resides, it shows -- for addresses 30-37 and 50-5f and
blank for all other addresses. Running i2cdetect on bus 0 takes far longer than
running on any of the other 19 i2c buses on the machine. My feeling is that the
touchpad is on i2c bus 0 but is not responding to any queries or commands. The
presence of the misbehaving device is causing detection queries to take longer
to timeout than on the other buses.

I feel like I've ruled out the following:
1. Runtime power management, failure the same with runtime power management
disabled.
2. ACPI specifying the wrong bus for the SYNA3602 device. As far as I can tell,
none of
   the other 19 i2c buses could be used for the touchpad.

Since i2cdetect does not detect the device, I am guessing that the problem is
I/O pin location, speed or polarity related. This a jasperlake device and
perhaps the pinctrl_jasperlake driver is not mapping the PCH I/O pins properly.
Perhaps i2c bus 0 is not tied to the correct PCH pins, or not with the proper
polarity, or incorrect clock speed.

I am no expert on any of these matters so any help with this would be greatly
appreciated.

I have looked at other kernel bugs that may be related, and done quite a bit of
general internet searching and haven't been able to find anything that seems
connected to this particular problem.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

----- End forwarded message -----

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
