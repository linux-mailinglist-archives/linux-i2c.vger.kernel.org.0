Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF50579277E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237910AbjIEQT2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354421AbjIELaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 07:30:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF6F197;
        Tue,  5 Sep 2023 04:30:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92B44B8108E;
        Tue,  5 Sep 2023 11:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C827BC433C7;
        Tue,  5 Sep 2023 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693913410;
        bh=RdrgRebQVMYD5+vh/Q9aQGUsa7aLHdkgmZjegcvTHzQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SXHy/K+I2JZWBTxu0P+tvwpuCbAKpUjofqK3xdoRWVP05NrKyV7A+ij+qaJcU5wFH
         UwEzBIuz3kefb0lDd+yj+BFMtKSedH7kh9oed6LWc4buYGya7httpaAWUtbpnVJ9L1
         AB2ZwdpXG6dxPtv/CqV2CWA34Q87MQkWqMdAsKv3dVdtR3fhmyJGmRgMmXwsfN6RJO
         CLOXueIoL1iGzTr+COyFM2qF5bFTfSI5LdxCo8g2/m4QhVpeDY6lhjRC9hiI59AuWb
         SxrOyHji9OzoWrZxcxLu/dyMITn1botjbMjN0emlgb4wmiTqcZMFjoW7hznht2u9KQ
         9lJo6aobhzOyQ==
Date:   Tue, 5 Sep 2023 13:30:06 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: rcar: avoid non-standard use of goto
Message-ID: <20230905113006.tqfe6xqoyfhzk5ak@zenone.zhora.eu>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904135852.12146-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Mon, Sep 04, 2023 at 03:58:49PM +0200, Wolfram Sang wrote:
> Kernel functions goto somewhere on error conditions. Using goto for the
> default path is irritating. Let's bail out on error instead.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
