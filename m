Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B336E9FB1
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 01:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjDTXKe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 19:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbjDTXK3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 19:10:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F309DB;
        Thu, 20 Apr 2023 16:10:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B8C664C9C;
        Thu, 20 Apr 2023 23:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3131DC433EF;
        Thu, 20 Apr 2023 23:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682032228;
        bh=Kto0aux5kFSf9qGMaMNywyrELy5nTWK9T+i8BtqkU10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lO+i6jlwCWZ9jtyxSGIIOCHp8XW2LbMvQC9UDXa6daHOXuHn/lI4Rv5Pld4gcJF/C
         bw0Rzxg5j6eDwOSGTCYStB2qyIdaI7GLrlPLX4WEPPxmJOhDVaVPEWPso4UAYNanxc
         L7q58hW+3z4xFtnldMftPXgS+dmvP7I2nBFqF5Q2AE1iWupf2Cgj2PaVR2pp2T5mGp
         yTdMyV6yMgT6x3HO1kqDAGDWeMyZsFnruI/M5cqATqRLMBsQr1ce3VTe5lzkx/w6WH
         ExiBioDQw6N+AzxtC/hBTk5EqRzj4flikIR9OgDQ3iCvqgKgyl1TKHFxuu97AoFr74
         C9oS4xVV8oQ8w==
Date:   Fri, 21 Apr 2023 01:10:24 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 4/4] i2c: muxes: pca954x: Add regulator support
Message-ID: <20230420231024.76bhgta6ehogen36@intel.intel>
References: <20230418103430.966278-1-patrick.rudolph@9elements.com>
 <20230418103430.966278-5-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418103430.966278-5-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Tue, Apr 18, 2023 at 12:34:29PM +0200, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
