Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA8273815C
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 13:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjFUJcK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 05:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbjFUJbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 05:31:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4458D1BF4;
        Wed, 21 Jun 2023 02:31:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C943C614D7;
        Wed, 21 Jun 2023 09:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A64C433C0;
        Wed, 21 Jun 2023 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687339860;
        bh=jj5prc/m9//HFm8xr+N5ZbfzrAhbjiUFjl/hHyLscm8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S7MELRNuVAcq/3RR2p127etX799EBj8N/6zccTApFtuX2gHEH1LvQUO6sYwcin3kX
         nA2zd5lP/EOGc1OyCbL6TMt1gzPwFogIZHKSjOrfIy91B9o8Y/Au4GNy1bqOxua3A8
         +/daTrRazZd6lsbXzDtFyJSLOfpCdJZmiT+BBFvhpFZ2+5sRkvDsUag5nqqi6+LhIL
         ror6BJj8A0DYaqC8Gan+hGjTvo9brDxTun8ZEcXEYuKx5M06mPaC+RxBDc7kpKO3n+
         Szh/RCzUuDNla2BgUlHoDrJY7mzHsfdt4grD0eACoNeF5EkBPQl0iH89U6OGrDYnnO
         OrbAtyT1n+iOQ==
Date:   Wed, 21 Jun 2023 11:30:56 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Michael Brunner <michael.brunner@kontron.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "acpica-devel@lists.linuxfoundation.org" 
        <acpica-devel@lists.linuxfoundation.org>,
        "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "robert.moore@intel.com" <robert.moore@intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "lenb@kernel.org" <lenb@kernel.org>
Subject: Re: [PATCH v1 1/2] ACPI: platform: Ignore SMB0001 only when it has
 resources
Message-ID: <20230621093056.5qfa3kn7ldgwsyeg@intel.intel>
References: <20230620163534.1042-1-andriy.shevchenko@linux.intel.com>
 <b9af5a068cc0b5e785c8e2ddfc70d811fd5929cd.camel@kontron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9af5a068cc0b5e785c8e2ddfc70d811fd5929cd.camel@kontron.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 21, 2023 at 07:46:42AM +0000, Michael Brunner wrote:
> On Tue, 2023-06-20 at 19:35 +0300, Andy Shevchenko wrote:
> > After switchind i2c-scmi driver to be a plaform one it stopped
> > being enumerated on number of Kontron platformsm, because it's
> > listed in the forbidden_id_list.
> > 
> > To resolve the situation, split the list to generic one and
> > another that holds devices that has to be skiped if and only if
> > they have bogus resources attached (_CRS method returns some).
> > 
> > Fixes: 03d4287add6e ("i2c: scmi: Convert to be a platform driver")
> > Closes: https://lore.kernel.org/r/60c1756765b9a3f1eab0dcbd84f59f00fe1caf48.camel@kontron.com
> > Reported-by: Michael Brunner <michael.brunner@kontron.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Works as expected - the SMB0001 device shows up as platform device and
> the i2c-scmi driver is enumerated again on the affected boards.
> Thanks a lot!

is this a "Tested-by: Michael Brunner <michael.brunner@kontron.com>" :)

Andi
