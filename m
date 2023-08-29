Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D060A78C498
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Aug 2023 14:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbjH2M6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Aug 2023 08:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbjH2M5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Aug 2023 08:57:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071521B7;
        Tue, 29 Aug 2023 05:57:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A8CB61940;
        Tue, 29 Aug 2023 12:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BAFC433C7;
        Tue, 29 Aug 2023 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693313849;
        bh=Hsop6h3Mj4t+MJnbkOYMg9H8IkpBGz7yjfKDTfG844Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UxRI0aQI6SwZyAQCt0ae/Pb/jejYo2s3zpx32WuQTiwcN5vj36W51XEGjqmCd1hAR
         g8MoIHtH96g732d8+LekGobzWyqyKAexM5JA4b+5hhMfRE+5VqgeEiC5sQNLbBkACe
         uPqLJqO7bySAZ48ZwqaJUIe4AsZPpP8ABJnMrIgpBxQKo+Jo0l0BwZGUu0Y8Sh9fNa
         WJMjsAme19lkRN55aILbdpnOZod7tg2tG4sH2R3CK93Dc8V3W84cdNmdZ1yZ8FtfUH
         AnkhFgN233Zw8aqPMtCbJzBGAowi127w0AfpEUR4W+92SK16NoZxrlEEpOn/7vMKAC
         TR0L/9RdALo0g==
Date:   Tue, 29 Aug 2023 14:57:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of
 dev_err()
Message-ID: <20230829125720.jqk52g3lsbfvodk4@intel.intel>
References: <20230825143234.38336-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825143234.38336-1-yann@sionneau.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yann,

On Fri, Aug 25, 2023 at 04:32:34PM +0200, Yann Sionneau wrote:
> Change
> if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
> into
> return dev_err_probe()
> 
> Also, return the correct error instead of hardcoding -ENODEV
> This change has also the advantage of handling the -EPROBE_DEFER situation.
> 
> Signed-off-by: Yann Sionneau <yann@sionneau.net>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
