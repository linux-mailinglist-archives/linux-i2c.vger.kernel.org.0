Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440AE7BD04A
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Oct 2023 23:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjJHV2l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 8 Oct 2023 17:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjJHV2k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 8 Oct 2023 17:28:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E629DD8;
        Sun,  8 Oct 2023 14:28:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB92FC433C8;
        Sun,  8 Oct 2023 21:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696800518;
        bh=TdLMx+y7d/bU9q7ckoMoBKOY3JAfX/DQuQaIQagdXIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MtahcB8X7Jfaclq/AQ5WVwuq2q1JEZ64vT4gGUt031RkDtL92QVwXmwvMhBUKyrK/
         DNgez3QsoYlMRcDuaxEmVPF+mPoVDSJjAoE0bBedBokZCKfoxZXjJPlPV/jHKT3Brt
         G8SZ3d1G5NmBnClkIw2xlP5H0ok1acmcYlCUtijl7nYt1qIYaUcE7Q1NUVYT3khrSx
         NvvOxOFhLiTdNoS7aQW47CdxDMLyZbIgWQh0ns68dZsoPEwwzxIcxaHFLuPRSjoVGo
         i9JohsdB6lreqrg/2wJGfrs1hz7f8p+v1QlOxop4EOWa5Esaxm/PEg86fTz15MPKJu
         R20sltc8anGjA==
Date:   Sun, 8 Oct 2023 23:28:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] i2c: Use device_get_match_data()
Message-ID: <20231008212834.bn7n657dwbqki5k3@zenone.zhora.eu>
References: <20231006224446.443015-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006224446.443015-1-robh@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rob,

On Fri, Oct 06, 2023 at 05:44:46PM -0500, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
