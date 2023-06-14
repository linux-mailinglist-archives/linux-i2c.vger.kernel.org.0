Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9D072FD38
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244225AbjFNLnw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 07:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244241AbjFNLns (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 07:43:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7AD1FFD;
        Wed, 14 Jun 2023 04:43:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3FDA63F8D;
        Wed, 14 Jun 2023 11:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7EBC433C9;
        Wed, 14 Jun 2023 11:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686743022;
        bh=0nI/Zrqzl+zedDlZ16mR2SeerenwkKTFqowGdWlN4iI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UYcIpBWxQS/1TMvIYuXaf4i0a22HG2ckB4WvRbZ/etvxdg+QGiRDlJNP+UfhwGedY
         QUBeKbdJqn0ArivSY86SXAqqjVfT5SqZlyGeLjDxvC5lYfUDgU1z2QlXJh6X0qThs/
         lzbYqgVLJjjbeOzmTE6cKfwcVNeG6UpAy+Xhz/JWQ37vXvZQIIeYPpg8NLL/umSfQp
         KcnAA1VRXu9wfc2Cx2EmLWCOrCw9vOW0q/IypwHMIyPa/bu3K7Henz8zoeZkCqX6Dy
         +l79+B1gDccnpy3jGcId/JeLgSvIhSO55r3h73yzyhFfhmrRFq6WkCuynD+hb+dtbu
         vRcsEI1ag/zPA==
Date:   Wed, 14 Jun 2023 13:43:39 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wang Ming <machel@vivo.com>
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drivers/i2c/muxes:Fix resource leaks in
 device_for_each_child_node() loops
Message-ID: <20230614114339.zhuhij6vobdnbse5@intel.intel>
References: <20230614112903.667-1-machel@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614112903.667-1-machel@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wang,

> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 5d5cbe013..90966de7a 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -106,6 +106,7 @@ static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
>                 } else if (is_acpi_node(child)) {
>                         rc = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), values + i);
>                         if (rc)
> +                               fwnode_handle_put(child);
>                                 return dev_err_probe(dev, rc, "Cannot get address\n");
>                 }

please, read it again and tell me what's wrong :)

Andi
