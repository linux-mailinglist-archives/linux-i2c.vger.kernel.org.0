Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A135A7D5EB0
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 01:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344604AbjJXXaU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 19:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344636AbjJXXaT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 19:30:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC8810D0;
        Tue, 24 Oct 2023 16:30:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2930C433C8;
        Tue, 24 Oct 2023 23:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698190217;
        bh=1O0jyc+9jRwfH+bIBSNC2AC/+zBx3VZH8zI/l7nXoXA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJl5MOKTV73WhzWjI/s8noNzFiTyaPyRAuduREg0WYPPk8HpQrSx2L8P/a3dDaxGY
         j7sqmqICC1xn1WvOc+Cp0SJZH337fifCL2PMyl7TAZxQTqJQzh7zuoRIPdYmvzZeLf
         ZX07Y30lwsF6qmOhaIAuO3+P30QunXCHIu2S3YvFJazL4UYmqqsqg38S2GB8+Wsog8
         DoDsazOV/Q4Y+qfa2tt3X9Bz+btPJkrhj/LuDZe+5fHLHnhQhvuQKzlcXeoh8AGXVL
         jgW4krSo5BG/0TnGAEgvQYF/bTk4j0QHVnlS1LNSAz2k8fVLX1TmBPoY+LoeV3JskY
         50N/qjx5GrmYA==
Date:   Wed, 25 Oct 2023 01:30:13 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <20231024233013.qtbdmnzek2flxk7a@zenone.zhora.eu>
References: <20231024223032.3387487-1-chris.packham@alliedtelesis.co.nz>
 <20231024223032.3387487-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024223032.3387487-3-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Wed, Oct 25, 2023 at 11:30:32AM +1300, Chris Packham wrote:
> Some hardware designs have a GPIO used to control the reset of all the
> devices on and I2C bus. It's not possible for every child node to
> declare a reset-gpios property as only the first device probed would be
> able to successfully request it (the others will get -EBUSY). Represent
> this kind of hardware design by associating the reset-gpios with the
> parent I2C bus. The reset line will be released prior to the child I2C
> devices being probed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
