Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2487710A6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 18:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjHEQyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 12:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjHEQyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 12:54:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A261BD
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 09:54:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B465060C17
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 16:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD86FC433C8;
        Sat,  5 Aug 2023 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691254453;
        bh=EISwfQCIq8ygSxcukclS+9NF0jtGmoJCIv+545yCfsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhS8XH5H/UcVDYG/P2YBtsXEKgwQIjMBcWr6IMkLFwAlaoLcIsKABankYO/nZspsf
         doCl4Z3Tn2hzGRDLSUoOYlzve/KIQrFyWyoyew+46eLZIeNfc5k/DV4fEsNXmoY4sy
         BmQPPT/CDedy0AZrQ5xMOKgfRjmwAjbBfN3X1E4hYnuwpn9JQevGYHc7MoaKaYANFM
         f0c6ObJenZcrtXmjk1/5DRlSPaGq9VZq27m7sTDM08cic6MP6T7C5gy1fHjkPFWkcv
         gUZXNb9B3Fhnid+J0EE4PSYBavSjlR78NHGFm0gI1AXE5VicFr/uJv4Q+iVvvFn8Oe
         7QZ1rnMyAuI1Q==
Date:   Sat, 5 Aug 2023 18:54:10 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Update documentation to use .probe() again
Message-ID: <20230805165410.flrha7jdfhb5tv6p@intel.intel>
References: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230627064522.593332-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Tue, Jun 27, 2023 at 08:45:22AM +0200, Uwe Kleine-König wrote:
> Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter") .probe() is the recommended callback to implement (again).
> Reflect this in the documentation and don't mention .probe_new() any
> more.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
