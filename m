Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BAF7D5B55
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 21:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344240AbjJXTSJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 15:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344021AbjJXTSI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 15:18:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FD6109;
        Tue, 24 Oct 2023 12:18:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8486C433C7;
        Tue, 24 Oct 2023 19:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698175087;
        bh=02/KBKaqOhmo7sOtLmLAqh48v9xojz8EBNv27xQczDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jfL0deDbHCTASTwvVJtZBMDhQANaLR5aZwQZSZoUEihfydVA5yplYU+Oo4mx9S994
         zaLf8hToZCK4JEMlsOZlq23xcoGZqlzHv++c2jpO6KTUvROV9PxK5G9ElS2+wqirEZ
         i6Ln7xFeGyMgc9gpYAPfojvOaYHb7zdVH8+2j7+NEsjREre0k1nj8MWS5Na9Yk2Lj1
         PKpiWr/CcqmFmSUaFmvOGwlhDNX+4Xxy/o111+daFm1MtEA9K/8atAEow8Vn8LqfXZ
         fdoBttptHYI5fBGpHYra/YrYK8hnfWmwP7cEpQpSkccLhdsNYyEWXmRLqdm5EIeyHz
         iqvQ60J86to5g==
Date:   Tue, 24 Oct 2023 21:18:01 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <20231024191801.kofb6cbczswp7xxn@zenone.zhora.eu>
References: <20231018210805.1569987-1-chris.packham@alliedtelesis.co.nz>
 <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

as you are working on the v4...

...

> +	if (drv_data->reset_gpio) {
> +		usleep_range(reset_duration, reset_duration + 10);

I'm not against this, but it's not optimal unless we know more or
less what to expect from reset_duration.

Do we have a rough idea of what reset_duration is? If we don't
then you could consider using a generic "fsleep(reset_duration);"
Would it work?

Rest looks good.

Andi
