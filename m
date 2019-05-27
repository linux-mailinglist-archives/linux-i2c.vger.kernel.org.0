Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5C42B06B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 10:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfE0Iju (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 04:39:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:12386 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726282AbfE0Iju (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 04:39:50 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 May 2019 01:39:49 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 27 May 2019 01:39:44 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 27 May 2019 11:39:43 +0300
Date:   Mon, 27 May 2019 11:39:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Ruslan Babayev <ruslan@babayev.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, xe-linux-external@cisco.com,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] i2c: acpi: export
 i2c_acpi_find_adapter_by_handle
Message-ID: <20190527083943.GX2781@lahna.fi.intel.com>
References: <20190505193435.3248-1-ruslan@babayev.com>
 <20190525005302.27164-1-ruslan@babayev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525005302.27164-1-ruslan@babayev.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 24, 2019 at 05:53:01PM -0700, Ruslan Babayev wrote:
> +struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>  #else
>  static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>  					     struct acpi_resource_i2c_serialbus **i2c)
> @@ -996,6 +998,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>  {
>  	return NULL;
>  }
> +struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)

This should be static inline, I think.

> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_ACPI */
>  
>  #endif /* _LINUX_I2C_H */
> -- 
> 2.17.1
