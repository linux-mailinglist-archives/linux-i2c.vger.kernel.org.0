Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7802890B6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 20:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388037AbgJISYo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 14:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731198AbgJISYl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 14:24:41 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96361C0613D2
        for <linux-i2c@vger.kernel.org>; Fri,  9 Oct 2020 11:24:41 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4C7Ggl6dbdz1rsMq;
        Fri,  9 Oct 2020 20:24:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4C7Ggl5Rsxz1qrDV;
        Fri,  9 Oct 2020 20:24:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 2mbYlDZWbOcq; Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
X-Auth-Info: LZoooTdPUM9XaQoDhU03clxRO+LEeX6w/lImTE/OmOPPBdMcRJILnzkfJa/RlVrk
Received: from igel.home (ppp-46-244-168-131.dynamic.mnet-online.de [46.244.168.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 17F1F2C2864; Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-i2c@vger.kernel.org, peter@korsgaard.com, andrew@lunn.ch,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
        <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
X-Yow:  Dehydrated EGGS are STREWN across ROULETTE TABLES..
Date:   Fri, 09 Oct 2020 20:24:34 +0200
In-Reply-To: <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
        (Sagar Shrikant Kadam's message of "Fri, 9 Oct 2020 08:39:40 -0700")
Message-ID: <87pn5rp89p.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Okt 09 2020, Sagar Shrikant Kadam wrote:

> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index f5fc75b..9b3d1ab 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	init_waitqueue_head(&i2c->wait);
>  
> +	/*
> +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +	 * FU540-C000 SoC in polling mode.
> +	 * Since the SoC does have interrupt it's dt has the interrupt

Typo: its

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
