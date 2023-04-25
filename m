Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472AB6EE22B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 14:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbjDYMsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 08:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbjDYMrx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 08:47:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF715D317
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 05:47:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AD5561646
        for <linux-i2c@vger.kernel.org>; Tue, 25 Apr 2023 12:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29627C433D2;
        Tue, 25 Apr 2023 12:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682426871;
        bh=oW2bDnnQ93WbGfVDtmNAZdSJij5YPDFQaDmTT48G0Cs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NelncIIR7MHjfz3lsmpLZKmHRIGehgqgxU6D5slnwH/4TOaOe4rBsXNdHaSWtNEnc
         9SQZRq1fwFhOyWSe+H/ue07N0UQ9k+i/MphSmQvaxGxJPxP24UXBRe2Btezq70WJrA
         DHNxEc+aA8hW7+UOtOwalvyokSpMTJ7+guPsis2Rx2+ZomCIZVmycmv+CkCuZqdL9w
         i02i5aUmlvfW/EA0ee9IO8NEipky++Quvltr19nRrP2ApBluzTWQ71gkzzLodwwJMz
         40pNhTtccKJ8I4y8riOvO74mjwKKNLasIhhoS2zvOEWtqYTp2Ln7JleBGfQ4CJYm/6
         AQhl/dPbaa2qQ==
Date:   Tue, 25 Apr 2023 14:47:48 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/2] i2c: i801: Add support for Intel Meteor Lake-S SoC
Message-ID: <20230425124748.fv2rwn7lvi6j3kop@intel.intel>
References: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Mon, Apr 24, 2023 at 01:57:56PM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Meteor Lake-S SoC South.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
