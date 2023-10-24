Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE7957D5EAB
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 01:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344586AbjJXX3y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 19:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344484AbjJXX3x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 19:29:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC56D7A;
        Tue, 24 Oct 2023 16:29:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751F2C433C8;
        Tue, 24 Oct 2023 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698190191;
        bh=cFl/SRn0VuzG6mAR05DlnNakEjbBlq4lqOuDCchSphQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Iy//ya4Yq8hzSccQFemdYnz+Sf3GXFbJ4Rc/wq60lzSjcU3k8YYfbPxisw9W75LbD
         Wq087OAO+Vtboax77r6kGIoulCY+fur+7GoTjPtgXWoNP87nUGtCybXX9ADZihif8V
         6DO7s6Z541Xx7l1nuPiK2uygyhiQiJY+BC1+MZCU+lYPWuIsfkWbPsEyVS59UMLKrM
         c14GtQDlQf6dKLICZbZZGpOO4lCamy24nOcRzrRB0OVgoAAb3rqPAZzJOe/WcZO/9J
         icj+zETRqcjo3ZQU+6ommsNJ/Xql85tp1NjoK5KNHwLm8Xq0veJXRoA1ZfGxyWQkwM
         uqQ6N2y2AO7UQ==
Date:   Wed, 25 Oct 2023 01:29:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: mv64xxx: add reset-gpios
 property
Message-ID: <20231024232946.r7bbnf5mnr2si47d@zenone.zhora.eu>
References: <20231024223032.3387487-1-chris.packham@alliedtelesis.co.nz>
 <20231024223032.3387487-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024223032.3387487-2-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

On Wed, Oct 25, 2023 at 11:30:31AM +1300, Chris Packham wrote:
> Add reset-gpios and reset-duration-us properties to the
> marvell,mv64xxx-i2c binding. These can be used to describe hardware
> where a common reset GPIO is connected to all downstream devices on and
> I2C bus. This reset will be asserted then released before the downstream
> devices on the bus are probed.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
