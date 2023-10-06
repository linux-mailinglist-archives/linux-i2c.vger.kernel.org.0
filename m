Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEA57BBBC9
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 17:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjJFPd5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 11:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbjJFPd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 11:33:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 260229E;
        Fri,  6 Oct 2023 08:33:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7E2C433C7;
        Fri,  6 Oct 2023 15:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696606435;
        bh=O9xzoqlYj7n5mkDnLVN55AsCgf8Lfjr5TpSdNR+UrsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F4CS/8XgIXNCqzyPWyNqYco6Y/sr0yLyLfj7GwO53cmD08cWDP7FDAZTHkPleW3lj
         2y0L5dSJGv8DOmwchm/PivslJUuyAGs77Szez2UOHPcvCoIEjVHiOpndCZ++06Bjwg
         2ubnxK8YbVu6bdhXcgMbPBI5/1HqnGp8DWamt1i9gAMDYlhlSQNQQQIwf2njoDULx6
         BENUNWlTntRtu8OaUIwuX8Sj3qLdx7EG6oUYe9lCP6ljk57QqawAJVGQKDUiULOk+b
         6S9VSDU/M8i+16G2RNDCgeGscfVDI780CircAKf5mE39LICbw8pPnZBXjZtSHN+Nm+
         2g0GxGlv2pszw==
Received: (nullmailer pid 3975164 invoked by uid 1000);
        Fri, 06 Oct 2023 15:33:53 -0000
Date:   Fri, 6 Oct 2023 10:33:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: pca954x: Add custom properties
 for MAX7357
Message-ID: <169660641279.3974559.16160487175292188205.robh@kernel.org>
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005134541.947727-1-naresh.solanki@9elements.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 05 Oct 2023 15:45:39 +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Maxim Max7357 has a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same as it may have unexpected side effects.
> 
> These should be validated for proper functioning & detection of devices
> in secondary bus as sometimes it can cause secondary bus being disabled.
> 
> Add booleans for:
>  - maxim,isolate-stuck-channel
>  - maxim,send-flush-out-sequence
>  - maxim,preconnection-wiggle-test-enable
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
> Changes in V4:
> - Drop max7358.
> Changes in V3:
> - Update commit message
> Changes in V2:
> - Update properties.
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

