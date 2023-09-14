Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CEA7A08F7
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 17:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240735AbjINPWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 11:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239524AbjINPWe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 11:22:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14392C1;
        Thu, 14 Sep 2023 08:22:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A4DC433C7;
        Thu, 14 Sep 2023 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694704949;
        bh=2l+pL/JOk07CrJ+5dzfMowBhm/GyALOaTEySvP0OfCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YRrZklOqygixaAR1yHRaKPjQGPbyQL2c/kWxbz1rpC+KxpiH3kBzXAniAHDoIJHxd
         HxkUevUuxpc7f76j4L7y+N4dZG/NgRxaX+bTEQ3CjWOpo1bWAUA6Zi0OTG7q89uQNF
         zYUEIia9KS8hwRJAluU21Jw45C+3P3QH4/VTKp37oLWxhY7JiN+DcPHWxzuIYQnC6I
         MTiwqweJYcaa3ZmjKOH6ZkIQCASbfu4mFfGXsMUbwlSF26GfgUl1XhiWP8U0QR7JIj
         WOtVTkKez+AoQkSNzVDpKHhH82zd69ogqH6fsXoSl3QDWMUPOtJy48mmNfIT+om4IG
         jO5uRXSaOXa7g==
Received: (nullmailer pid 1445219 invoked by uid 1000);
        Thu, 14 Sep 2023 15:22:27 -0000
Date:   Thu, 14 Sep 2023 10:22:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: pca954x: Add custom properties
 for MAX7357/MAX7358
Message-ID: <169470494704.1445160.2226578648638158792.robh@kernel.org>
References: <20230914113416.1285518-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914113416.1285518-1-naresh.solanki@9elements.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Thu, 14 Sep 2023 13:34:14 +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Both chips have a configuration register to enable additional
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
> Changes in V3:
> - Update commit message
> Changes in V2:
> - Update properties.
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

