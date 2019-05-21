Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5024A75
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 10:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfEUIdw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 04:33:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:56274 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbfEUIdv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 04:33:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7017BAB9D;
        Tue, 21 May 2019 08:33:50 +0000 (UTC)
From:   Andreas Schwab <schwab@suse.de>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.
References: <1558361478-4381-1-git-send-email-sagar.kadam@sifive.com>
        <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com>
X-Yow:  I can see you GUYS an' GALS need a LOT of HELP...You're all very
 STUPID!!  I used to be STUPID, too..before I started watching UHF-TV!!
Date:   Tue, 21 May 2019 10:33:48 +0200
In-Reply-To: <1558361478-4381-4-git-send-email-sagar.kadam@sifive.com> (Sagar
        Shrikant Kadam's message of "Mon, 20 May 2019 19:41:18 +0530")
Message-ID: <mvm7eakjjf7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mai 20 2019, Sagar Shrikant Kadam <sagar.kadam@sifive.com> wrote:

> The i2c-ocore driver already has a polling mode interface.But it needs
> a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> There is an erratum in FU540 chip that prevents interrupt driven i2c
> transfers from working, and also the I2C controller's interrupt bit
> cannot be cleared if set, due to this the existing i2c polling mode
> interface added in mainline earlier doesn't work, and CPU stall's
> infinitely, when-ever i2c transfer is initiated.
>
> Ref:previous polling mode support in mainline
>
> 	commit 69c8c0c0efa8 ("i2c: ocores: add polling interface")
>
> The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> FU540-COOO SoC.

After commit dd7dbf0eb090 this no longer fits.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
