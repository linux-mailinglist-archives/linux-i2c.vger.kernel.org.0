Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95048790BF8
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Sep 2023 14:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbjICMqa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 08:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjICMq3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 08:46:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA0810F;
        Sun,  3 Sep 2023 05:46:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4FD5D60B92;
        Sun,  3 Sep 2023 12:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA498C433C8;
        Sun,  3 Sep 2023 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693745185;
        bh=VVXJthKSMlJi75kl9Cv7LXhu+JdojgrKZICCzMQ2eaM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JKnhCmoB/f1GxHq2YkWcXFNUuVCNZhXjeQsuEFgwQpfY7fAVThRMuX5OD05d7Z9K6
         vG91DODKuV7ZZMvWigvCeyUgrD5kD9T7fTEHUvoR7Tz6ePyJj7xD879sXr8bUIcohc
         Jx2nOUk2ucTkcpUF0HZlQjD7ZOYESoLeO2kR6U28OlMpSVsteziW/ZLO4a1ZjPV/ZI
         oAut3VEwVykWdrTWaLcaXj9aJ/26nUbWZplXZLSXRlevwDPVwANpsYAJ+F+XNpS5JL
         73RBjU/PNuXY9T6NvcmHTY1qs2J4X9BeqIJrfRDkj1xAzfUKWFmCEkJ/UHJBjxhMdj
         Za/E0hlY1cksA==
Date:   Sun, 3 Sep 2023 14:46:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Sean Nyekjaer <sean@geanix.com>
Cc:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816080552.3045491-1-sean@geanix.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Pierre-Yves, Alain,

mind taking a look here?

[...]

> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>  	u32 dnf_dt;
>  	u32 dnf;
>  	struct stm32f7_i2c_alert *alert;
> +	bool atomic;

this smells a bit racy here, this works only if the xfer's are
always sequential.

What happens when we receive at the same time two xfer's, one
atomic and one non atomic?

Andi
