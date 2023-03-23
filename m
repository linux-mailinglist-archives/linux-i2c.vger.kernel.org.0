Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284576C65B7
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 11:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjCWKwC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 06:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjCWKvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 06:51:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE32F36FEE;
        Thu, 23 Mar 2023 03:50:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 39193625AD;
        Thu, 23 Mar 2023 10:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235A2C4339B;
        Thu, 23 Mar 2023 10:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679568637;
        bh=6bjS4jIxMl+j083BULXsAmGvEUpjTDQFOqlIa1PfSXk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rxegH0bb9kGbPsubd8HWExWGB4f5XxqpTBC/o8JxMpCXqMBChgjs55D3+PSXblCTY
         wEpjtrvnXNn4O7M6hUuH1ImAE0E99YbFWFoH9g1Ilf5QwWHOuTLqqGIE7AHRpttFZf
         APXvPbX8NmiZAMw0Y4qy6VQCqXkcZLeKir2/Y5Nog09M40NLguOAnrDZn7fhrbSnya
         n83f0Ay8Ga4jufUXB9FbVuAvqgz95PwAsKQMMUlmeCa6IA+DucdX2/79bNUKt1BZzu
         h8q97KKi3FNkpswN/SXmDk4sVL9eLs9rP8lbnuZkSF7DtwiPJi6QcYSsvhpL4UK4Ci
         dkJXlODITnaFg==
Date:   Thu, 23 Mar 2023 11:50:34 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for Maxim MAX735x/MAX736x variants
Message-ID: <20230323105034.zgrgnc35h3emad4o@intel.intel>
References: <20230323074419.2494609-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323074419.2494609-1-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

> Patrick Rudolph (4):
>   dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
>   i2c: muxes: pca954x: Add MAX735x/MAX736x support
>   i2c: muxes: pca954x: Add regulator support
>   i2c: muxes: pca954x: Configure MAX7357 in enhanced mode

this last patch did not come through as you can also see here[*].

Is it just me not receiving 4/4? If not, can you resend, please?

Andi

[*] https://lore.kernel.org/linux-i2c/?q=f%3Apatrick.rudolph%409elements.com
