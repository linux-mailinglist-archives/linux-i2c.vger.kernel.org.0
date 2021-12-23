Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A45747E48E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Dec 2021 15:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhLWOhX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Dec 2021 09:37:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:61399 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232888AbhLWOhW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 23 Dec 2021 09:37:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640270242; x=1671806242;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vRP+R7DjpvAqxPqTnUXL6uwSG+wNEWbxuEFbD9QshhY=;
  b=BJx88SR+a1P6ibTVdXgca7KJHgYdNVvH7pclekXTwDWzwuUd5J2B1zIJ
   sM2uhK+yZULwqPr1qyzKlVxCM4WcstIFRkFTfk5N3Vx6cmBfN5FnYKEG8
   I6bJz5tQh5rC2DD/xUGza++9lsTxKSJkqw92+6ilj/OIP9J6miWiOj/j2
   A9qX6PEG/KE+HMcVq/5jT+BGrRA3exN8ATn09vIBj0mMLqI45QyZwvfhp
   VIxL7xBepL76vVtLpF4Il4pFnohYPhIn03a9MY1vPNmViAqJzWevUSudp
   3EAz+axlwfD5Tw4zyYRRjLd9LXzb0Dp9zvOJrp0J/SwUa1DoJuSnmCsGg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="301596370"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="301596370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2021 06:37:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; 
   d="scan'208";a="617506401"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orsmga004.jf.intel.com with ESMTP; 23 Dec 2021 06:37:19 -0800
Message-ID: <a1b47be4-f208-1a59-d704-99a463bb2fe0@linux.intel.com>
Date:   Thu, 23 Dec 2021 16:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: Re: [RFC 2/2] i2c: designware: Add AMD PSP I2C bus support
Content-Language: en-US
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com, upstream@semihalf.com
References: <20211222094558.2098791-1-jsd@semihalf.com>
 <20211222094558.2098791-3-jsd@semihalf.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20211222094558.2098791-3-jsd@semihalf.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/22/21 11:45, Jan Dabros wrote:
> 
> Introduce new CONFIG and add new menuconfig selection list in order to
> allow (optional) selection between baytrail and amdpsp semaphore.
> 
For the Linux distribution point of view selection must happen runtime. 
Otherwise either AMD PSP or Baytrail semaphore support is missing from 
the installation image.

Jarkko
