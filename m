Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 135E37429ED
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 17:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjF2Pww (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jun 2023 11:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231919AbjF2Pwv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 11:52:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FF01715;
        Thu, 29 Jun 2023 08:52:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D12961574;
        Thu, 29 Jun 2023 15:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBA2C433C0;
        Thu, 29 Jun 2023 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688053969;
        bh=CCKbzzXdJBYuI+KW0adHtNgjwnMf15NSqnKLyLN6/jk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mtFlczZ03HLwJp8zf7gcnm48scmZ56OxFM8rJbBkKwaIgtwpDpdz81n73wV6WnSOI
         z8PyiY6oTvqcpHIfvSmsHVy4KM1jfaRP4+Z3jjcfzxOMemWGDggwYUs2X7bXgl4gMN
         FV0hAjlpFcmV2ZaYKzD3wdDOh9lFvb+61FKbxhhTPCbhlK/akVSzklgQl+zQ3hYQJU
         Jj6v3ItTlZUueS1Z3ZG5IJNYcfbFlnqh1HamlViKSB4wCc1EMwwt2kfK/Pt5Uy528K
         FKDL097TdGgTKFVThDqBJxthUBNWVUgrAd/xmgITMd+xmKgDrZQrgQTGMuqCb8ZR1V
         KWVWMuxQRYzVg==
Date:   Thu, 29 Jun 2023 17:52:45 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 1/4] ACPI: bus: Constify acpi_companion_match()
 returned value
Message-ID: <20230629155245.syd6mx2rffbvbkol@intel.intel>
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
 <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Jun 26, 2023 at 02:00:23PM +0300, Andy Shevchenko wrote:
> acpi_companion_match() doesn't alter the contents of the passed
> parameter, so we don't expect that returned value can be altered
> either. So constify it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I guess I'm late for adding my

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

here.

Andi
