Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5F5667D44
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Jan 2023 19:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233651AbjALSCc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Jan 2023 13:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240124AbjALSBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Jan 2023 13:01:48 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7FE1A041;
        Thu, 12 Jan 2023 09:23:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 8CC0FCE1EE8;
        Thu, 12 Jan 2023 17:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093B4C433EF;
        Thu, 12 Jan 2023 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673544218;
        bh=vH/o83cLSYXUJQUG47sGbRqM7Nxy9CAYi6BHrDZBWlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hZ+Jedez7BxP2mTRuDnQdP3mNtC/bxyFrDTbOs66BKDtb6MwUmi1QCmZ+/laKH260
         2/JyF7uV6SVzRFqfw/HJZetMmMYbOSZNw268G3b5aD04QYktTCuQG2RYt/Li46Dpv6
         UiX9zb5HOUS0THNE9/o91Nb3CDUDdGcKrKyFK0nl40L1bOQ1kVViUUHwcOdH3NvwRn
         J0R1KG1ddm8Z5OCdcXuK9OqijZZLDQ58mrhJixS0FXdw+DZ/byVAphbfNYIcMIoQbi
         HCaKPOUKzZt5yjyBfltLFEM1q/O5FGXuzDlcDtfgd1PqqnW9NpMao33E5SZctbAV5E
         JkyDRQjNnkirw==
Date:   Thu, 12 Jan 2023 22:53:34 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 10/13] phy: tegra: xusb: Disable trk clk when not in
 use
Message-ID: <Y8BCFhDuy1gzFrX6@matsya>
References: <20221114124053.1873316-1-waynec@nvidia.com>
 <20221114124053.1873316-11-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114124053.1873316-11-waynec@nvidia.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14-11-22, 20:40, Wayne Chang wrote:
> Pad tracking is a one-time calibration for Tegra186 and Tegra194.
> Clk should be disabled after calibration.
> 
> Disable clk after calibration.
> While at it add 100us delay for HW recording the calibration value.

Applied, thanks

-- 
~Vinod
