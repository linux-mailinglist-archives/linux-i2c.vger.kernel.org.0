Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA01F7AF62E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 00:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjIZWL7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 18:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236049AbjIZWJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 18:09:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C7923127;
        Tue, 26 Sep 2023 15:07:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F5FC07618;
        Tue, 26 Sep 2023 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695763840;
        bh=4GMeUJSKKReF6s3SEqksGnEq5C7PEvuoRGdNtW/1FtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pUNQ7l0J63nPh9zcScWHpNRd7CxN1iVpP5n3+8OHy+P/13ioWXGZHGSDOWx9TIBEc
         cUcEy9LpdMXEGN7+cZ4NaIRl4bJQ6Pwxa08G6O9cU/9vkDscjQrXvpHeYaPowK3nMM
         j5zjUxRYn6Mcf6Fk9+GvczcYC+kX9sLms7sObqU2LUPFAZYnhlPGpJ9O0pw5ZN3BtD
         YGn+G/01R5WCVJ41DEjiDhrK5O5df2XO+6qbJb8sxqGk9U/3SOan0p3z4/85dKc8HO
         pGI0ujyB7LKjR412OyN/v8DWyf8nWfpnsxq9ISvFNFi8fzpaENexQN3h7RC5DI6Q0/
         dko1p/x23ucPA==
Date:   Tue, 26 Sep 2023 23:30:35 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/3] i2c: xgene-slimpro: Migrate to use generic PCC shmem
 related macros
Message-ID: <20230926213035.5dwlepgocda7xgd2@zenone.zhora.eu>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
 <20230926-pcc_defines-v1-2-0f925a1658fd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926-pcc_defines-v1-2-0f925a1658fd@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sudeep,

> Use the newly defined common and generic PCC shared memory region
> related macros in this driver to replace the locally defined ones.
> 
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
