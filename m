Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9EB29501C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Oct 2020 17:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502660AbgJUPqb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Oct 2020 11:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502659AbgJUPqb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Oct 2020 11:46:31 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4069FC0613CE;
        Wed, 21 Oct 2020 08:46:31 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h24so3916879ejg.9;
        Wed, 21 Oct 2020 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=7ehyNgQOK7CqueR6HFQ7GOu3HkZtQCthPvOvqzAFJr4=;
        b=pa58BoU72nD8x9JfH451BnGeVPr1/EavTuLx1ixWLIIHKCOdAbi0TsleJ8QgwtYtdR
         pVfbW+ZjFM0p/OfkmkmleB1vi02LILpQ39OUKcyFXwKvgEiqBNS79pKmHNjtXEiKBhSi
         pohh7n4Yxke93I+gZCjIV5wCyHdFtGPwaZ4wZ3OHkEGNhYWNJdFwMYL6qfvb2VE+62oN
         ZxXtfGDbfUDax+mMdUWG+5mkU9ttXSXnEs9ALgEismZxYFTCOI4w/fG+/FNNF15M4Sr/
         lfgvbD48CWNKTykdVeGRjDX4rWs9to+6qq09zRudfEkVDGLqvuYuALoOCVMf+BrCl7on
         +gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version;
        bh=7ehyNgQOK7CqueR6HFQ7GOu3HkZtQCthPvOvqzAFJr4=;
        b=I+j7nSnpbmYpI8fmLKJ9T1R/dea6ydELSGtApdDGlCZb7eSD+53vM8yySkIzSMvqRa
         aAzSl7VPyEENrHH0T4a43kX5wWJ+wzmEp/Krd0/Vzt9/HZF91RF2Eq0504VWiLlxsrSc
         VuXocjznRY+wyeUABHi1/yhMsrrbld3jD/lwykmzAPKXgAysEKyHER60xYgR5O/1d1O6
         KzjweF3PGPOtlgfbQBrRYKAcbwIt652c7TOxsYb2Y4eK9yl+ObWJJzM4XkcY+pM6kxKX
         JpdKGSTUA3UAZlTk2kY5tZJjNU1A2bRfUhtE0FGnPsj4Wr2RKYb6kom5XGCdJX1ntpPj
         bIag==
X-Gm-Message-State: AOAM5316UGHd/X0Q5qKcCdHA0dDxxEsEvVi3jRr13fGJgbVS25L5Zznu
        8k5RPGpEuqcUIAJblzC4OJ8=
X-Google-Smtp-Source: ABdhPJwbEgmR444iU3kT5iZcp7WU4/X4Lu7XdAZleSkjQR6OG1NcykLs2li3WctaKTzJEciB0GzWfg==
X-Received: by 2002:a17:906:3cd:: with SMTP id c13mr4062189eja.25.1603295189979;
        Wed, 21 Oct 2020 08:46:29 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
        by smtp.gmail.com with ESMTPSA id ss7sm2445870ejb.28.2020.10.21.08.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 08:46:28 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1kVGJn-0008Er-Pi; Wed, 21 Oct 2020 17:46:27 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v4 1/1] i2c: ocores: fix polling mode workaround on FU540-C000 SoC
References: <1603291814-240377-1-git-send-email-sagar.kadam@sifive.com>
        <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
Date:   Wed, 21 Oct 2020 17:46:27 +0200
In-Reply-To: <1603291814-240377-2-git-send-email-sagar.kadam@sifive.com>
        (Sagar Shrikant Kadam's message of "Wed, 21 Oct 2020 07:50:14 -0700")
Message-ID: <87k0vjk2ek.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>>>>> "Sagar" == Sagar Shrikant Kadam <sagar.kadam@sifive.com> writes:

 > The FU540-C000 has a broken IRQ and support was added earlier
 > so that it will operate in polling mode, but seems to work only
 > in case interrupts property is missing from the i2c0 dt-node.
 > This should not be the case and the driver should handle polling
 > mode with the interrupt property present in i2c0 node of the
 > device tree.
 > So check if it's the FU540-C000 soc and enable polling mode master
 > xfers, as the IRQ for this chip is broken.

 > Fixes commit c45d4ba86731 ("i2c: ocores: add polling mode workaround
 > for Sifive FU540-C000 SoC")

 > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

LGTM, thanks.

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
