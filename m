Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C907C70F8
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 17:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378304AbjJLPIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 11:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347050AbjJLPIN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 11:08:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF0FD7;
        Thu, 12 Oct 2023 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697123291; x=1728659291;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=/1CsdNQjxQo9/5qh0TNOdpn1mckdm/TJkKZvUEyDvlE=;
  b=LNRovgrIEMHQw4Haix1K5Yd01CMB4GTVPXx25plK4KySO8Wh0iB+Gans
   jEXx113U5YPUMPfTIu5u5bKsfHIglmUTFTaaeYKNNsv+Ag//sH1LtV6IA
   5Yyj0e728yYW9A8Zk6dyyjGpzNItB9hPl12srAAyHZIvjF4/lsI7QE82Q
   5OUR4bVqDTKsmLv6ZjHNhoiVGel0Il31Lutjl5Nv11kzeHjMMI6ysJrlD
   th2AjtvEvoseoEmawwQqvHwoRNsmrxbyTR2GJUHwQvwYFX9KN/plbJ1bM
   G3FXB8Tw1KvCnsvDIMPmiNlwItGxMmSfcpa9QpNsIKtmjKO/PsEK/aORh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="415993228"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="415993228"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085696842"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1085696842"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:08:05 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>,
        "lakshmiy@us.ibm.com" <lakshmiy@us.ibm.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "ninad@linux.ibm.com" <ninad@linux.ibm.com>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] i2c: smbus: Allow throttling of transfers to
 client devices
In-Reply-To: <bf0d71383958e7cc88bc84c7e2378f10d3a486f3.camel@suse.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <20231009211420.3454026-2-lakshmiy@us.ibm.com>
 <bf0d71383958e7cc88bc84c7e2378f10d3a486f3.camel@suse.com>
Date:   Thu, 12 Oct 2023 18:08:03 +0300
Message-ID: <87y1g7zxnw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 12 Oct 2023, Jean Delvare <jdelvare@suse.com> wrote:
> On Mon, 2023-10-09 at 16:14 -0500, Lakshmi Yadlapati wrote:
>> Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
>> ---
>> =C2=A0drivers/i2c/i2c-core-base.c=C2=A0 |=C2=A0=C2=A0 8 +-
>> =C2=A0drivers/i2c/i2c-core-smbus.c | 143 ++++++++++++++++++++++++++++---=
----
>> =C2=A0drivers/i2c/i2c-core.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 23 ++++++
>> =C2=A0include/linux/i2c.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
>> =C2=A04 files changed, 145 insertions(+), 31 deletions(-)
>> (...)
>
> Non-trivial patch with no description -> not even looking, sorry. You
> can't possibly propose a change to the core of a subsystem and not
> bother explaining why this change is needed or what purpose it serves.

We've even managed to write extensive documentation on this!

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

>
> (And yes I know there's some information in patch 0/2, but that's not
> going to make it into git, so it will be lost. Commits should be self-
> sufficient, not only the implementation, but also the description.)
>
> I would also suggest trimming the To and Cc lists. I can't really see
> how linux-media and dri-devel are relevant here for example.

--=20
Jani Nikula, Intel
