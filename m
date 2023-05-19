Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D975A7095F9
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 13:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjESLIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 May 2023 07:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjESLIt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 07:08:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FC0BB
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 04:08:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F0116569A
        for <linux-i2c@vger.kernel.org>; Fri, 19 May 2023 11:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC96C433EF;
        Fri, 19 May 2023 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684494527;
        bh=H4YPFanThrqB0NIQ2ok02BcYnKhqEz2+xilHRIu1/5A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kXxV+qqJXVYQoQAlv1bndqI9XXu1QQTvl9aaQTaHimedzzLQDmRK6ouvKpRKv24LR
         4Y7rokQqG4jc7kxF5B4Lcx2rlyg2Gi1bu35Zft1nNtfQa1d8nou1++W3E+fVZR8i8M
         d9YL/zRcUmEJzkMDis4lOWnKvmCzWud8bqNUf2RioShpYKp5I3ZEmHg6wY0l1sKL0h
         yDO/VefqST3rGmvjhpEnlr3dK3ltFKUlVVGiYXjiB2b3PYLF7aP09kZH0Uqr1ktfuw
         AotkxiAjzaLbuWH/PD1P3QJX3InJL8vXiZKDZwarVIO26XCF8Eh+Tk4HdDTUtT6b0A
         aCLXw6QQcESHg==
Date:   Fri, 19 May 2023 13:08:44 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3 3/3] i2c: i801: Add support for Intel Meteor Lake PCH-S
Message-ID: <20230519110844.iolkgvnleaisd7oo@intel.intel>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
 <20230512115001.81309-3-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512115001.81309-3-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Fri, May 12, 2023 at 02:50:01PM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake PCH-S.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
