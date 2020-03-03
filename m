Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C171782AB
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Mar 2020 20:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbgCCS6Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Mar 2020 13:58:24 -0500
Received: from mail-out.m-online.net ([212.18.0.10]:50025 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgCCS6Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Mar 2020 13:58:24 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48X5rF3kTjz1rfpm;
        Tue,  3 Mar 2020 19:58:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48X5rF2LHZz1qyDy;
        Tue,  3 Mar 2020 19:58:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id I6yz9QSyHTDe; Tue,  3 Mar 2020 19:58:20 +0100 (CET)
X-Auth-Info: mMuh2NPXrbgpI9l5wSYLd6DyQqtKQ/cYVQr5g6TtkvmnFblEHT0brLheGgEhEqwg
Received: from igel.home (ppp-46-244-184-188.dynamic.mnet-online.de [46.244.184.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue,  3 Mar 2020 19:58:20 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
        id DFB642C0FF3; Tue,  3 Mar 2020 19:58:19 +0100 (CET)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        debian-powerpc@lists.debian.org,
        Mathieu Malaterre <malat@debian.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] macintosh: windfarm: fix MODINFO regression
References: <20200303125046.5157-1-wsa@the-dreams.de>
X-Yow:  ..  Do you like ``TENDER VITTLES?''?
Date:   Tue, 03 Mar 2020 19:58:19 +0100
In-Reply-To: <20200303125046.5157-1-wsa@the-dreams.de> (Wolfram Sang's message
        of "Tue, 3 Mar 2020 13:50:46 +0100")
Message-ID: <87d09tw9is.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mär 03 2020, Wolfram Sang wrote:

> sound/aoa/codecs/onyx.c
> sound/aoa/codecs/tas.c

These are loaded explicitly via request_module (as snd-aoa-codec-%s).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
