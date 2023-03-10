Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64D06B3737
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 08:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCJHSl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 02:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCJHSl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 02:18:41 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BBD6130B;
        Thu,  9 Mar 2023 23:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678432720; x=1709968720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FJu325oNwFinYt0K14XQFuq7WkzPV6Z6PHz2Vd/EK8=;
  b=AvHzHTQoUUPuCE5NOksf+91Nv2KrSFNcyGQyithOCFQpc8ZrLWwJKX61
   xJwRf8e39XCwTMYShDn0hy/cqR1TmBkIyLxWONXkdtNJ5/lxxtuT4L60B
   vWihzhAQkDQouuUokjC5Z0qXQgVuSkzqyLKSy1NZaweIBDnaDdyWFMYDy
   heLg7y15qWa7iH5EHaTSyujrHKOcSCNa9HelfoIKf9BPvyrNFqg0+dOhN
   LihV0BuSvOA1/K7WeepSD4YyhejlY1X+BI5trl0xDqZB/9xNbH7QKkDws
   sLiI7KlanIdnR9okGiBolod9I7fBF7DYbMR5ImbaBGsQSoghnv7J/5S0Y
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="401528380"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401528380"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 23:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="851812467"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="851812467"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Mar 2023 23:18:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1DA5D143; Fri, 10 Mar 2023 09:19:22 +0200 (EET)
Date:   Fri, 10 Mar 2023 09:19:22 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     liao.zenghui@zte.com.cn
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix slave not acknowledge when address
 matched
Message-ID: <20230310071922.GZ62143@black.fi.intel.com>
References: <202303101510464477898@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202303101510464477898@zte.com.cn>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Mar 10, 2023 at 03:10:46PM +0800, liao.zenghui@zte.com.cn wrote:
> static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
> {
> + u32 enabled;
> +
> dev->status |= STATUS_ACTIVE;
> - regmap_write(dev->map, DW_IC_ENABLE, 1);
> + regmap_read(dev->map, DW_IC_ENABLE, &enabled);
> + regmap_write(dev->map, DW_IC_ENABLE, enabled | DW_IC_ENABLE_ENABLE);

Looks like this patch has some whitespace damage. Probably good to use
git send-email or so to make sure the formatting stays intact.
