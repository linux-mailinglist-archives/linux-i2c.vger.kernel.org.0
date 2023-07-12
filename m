Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D1C750D1D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbjGLPwL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbjGLPwI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:52:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326AE1FC8;
        Wed, 12 Jul 2023 08:52:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7A806189F;
        Wed, 12 Jul 2023 15:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9BBC433C7;
        Wed, 12 Jul 2023 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689177126;
        bh=Jlo10pILmhB7LyeW7g/VTLcTaOOBrUbMZUZ8dB39h6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=No3bbUwD0BUiHtjkZc7iN36OpXZ7ik+KEIA9CmNLfXXwySm3siMFgoVyM5A1cVVR9
         9M6HJL4RGvdv0tk2HBXi5Ko8ZGIV/Ao1HmAysKXzYvWPKTlcn/yQ5+/oMlEMPvNILx
         iERZMg5mI1kVHTilpcdduFdVlvJvsWbt9StcRK4e5oNO9e1GCWYmXUyWbWFYY5Qfj0
         bwwxvjuXH5aRKiaZ/JNC+bMXHiaAJhaCJhvuUFwLwLRTLETycVO1vDdqlZTmPwexDa
         wt/skTnMls7PzQe6yruuuaI2dK5V4Xx8fDIbvYVJJQ+TSsWRhIfHB8HtUQaWzvvOYy
         Ge5AepEf9OI4g==
Date:   Wed, 12 Jul 2023 17:52:01 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/11] i2c: qcom-geni: Convert to
 devm_platform_ioremap_resource()
Message-ID: <20230712155201.hlp6rtfgwi7d6sg4@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-6-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-6-frank.li@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:45PM +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
