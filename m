Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2137786C50
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 11:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237435AbjHXJwL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 05:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240816AbjHXJvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 05:51:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105E6170C
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692870711; x=1724406711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AI9VlzUSMQQe8MyByYFKM2faa1GqKzzYixLO2EdXA7w=;
  b=CoAjVHMwVPYtEiPV9sRax+4qb6Ej//aDx2WrY6VDo4iokrGGoIBANXc7
   fBCI9lVJ7YFVVLyEwkk3dTccFhRLvlkoziCJyAzTVSRnJ0FfuBbx0pTHr
   VdlTocsmcd7FUOWmIt6apuiI0GK8pkOiEqOlE4Y+/DFykwuPC1NNR11+V
   l+/HL8zSOfPw3gw51YO5Yq9bDqxzPuHimyjxK0QT59i+/pk4NlkW8YpCs
   zK0EBSwoC7MsTBfEnanj4r4Q9M1rO/val6INIzWD0kVi65nG+7s6Yj0ej
   6XVwrRhb/ve9TaEAUsmeiMGnPLQsZE6Jb0J2U4sc5TIwG2vhZBvQ7urMH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405400288"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405400288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851424817"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="851424817"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.156])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:51:41 -0700
Date:   Thu, 24 Aug 2023 11:51:39 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        linux-i2c@vger.kernel.org, zhifeng.wang@intel.com
Subject: Re: [PATCH v10] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZOcoK2W6p9BQwbeH@ashyti-mobl2.lan>
References: <1692796047-9614-1-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1692796047-9614-1-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

On Wed, Aug 23, 2023 at 09:07:27PM +0800, Wentong Wu wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> module with specific protocol through interfaces exported by LJCA
> USB driver.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

where is the rest of the patches?

Andi
