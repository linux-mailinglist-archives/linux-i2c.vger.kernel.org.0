Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFDE763981
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 16:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjGZOq2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 10:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjGZOqY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 10:46:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF2A132;
        Wed, 26 Jul 2023 07:46:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A87A61B0D;
        Wed, 26 Jul 2023 14:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCE4C433C7;
        Wed, 26 Jul 2023 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690382782;
        bh=ac1IB6GcnstuSIv+AKNdyB+dOcsk25Rvnlxcmo7PaCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bYj32l3QNuBWz/km5z/obm8ytBpcvAi4oaV4uV6V/QcA/6R3ma8nZUf/yuBqqJSRe
         rwoVNenutxR+yKSlDV9WoQgpUcLbGLs46BVhmHubJ0Kph1/yw2vEezRnlI2eoBlbTH
         hBIfcmvKFBHcq7B8cqYWAj0qvWMlgctamD9sGxHmMyOIKU8HAjFLm2LXMr0ld1Xn5y
         1zZ0wCXlVF4JKMq6mr2CkB8lCAngn4A1+ONP7Y0n0q5V6HrzW6M+D6InWh1p3XAUPz
         ODMCRPRCpJLzDsN+SVwHeeYx2pQYO423j4q9ciPcvpByo4CQP+iXVvQoqHiCX3h66/
         YKGNg3vZUyKhA==
Date:   Wed, 26 Jul 2023 16:46:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] i2c: s3c2410: Remove redundant dev_err()
Message-ID: <20230726144619.qo3ttjjmjvliwz23@intel.intel>
References: <20230726174226.2480552-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726174226.2480552-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ruan,

On Wed, Jul 26, 2023 at 05:42:26PM +0000, Ruan Jinjie wrote:
> There is no need to call the dev_err() function directly to print a custom
> message when handling an error from platform_get_irq() function as
> it is going to display an appropriate error message in case of a failure.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Correct!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
