Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0A74671BE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 06:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378514AbhLCF5x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 00:57:53 -0500
Received: from smtprelay0250.hostedemail.com ([216.40.44.250]:55412 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231182AbhLCF5x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 00:57:53 -0500
Received: from omf18.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id C73411812EF2A;
        Fri,  3 Dec 2021 05:54:27 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 3C21F35;
        Fri,  3 Dec 2021 05:54:26 +0000 (UTC)
Message-ID: <a5d44f520d9b1e0e7b48860000a8e657ef8e5b39.camel@perches.com>
Subject: Re: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
From:   Joe Perches <joe@perches.com>
To:     Sui Chen <suichen@google.com>, linux-kernel@vger.kernel.org
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com
Date:   Thu, 02 Dec 2021 21:54:25 -0800
In-Reply-To: <20211203023728.3699610-2-suichen@google.com>
References: <20211203023728.3699610-1-suichen@google.com>
         <20211203023728.3699610-2-suichen@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3C21F35
X-Spam-Status: No, score=-3.25
X-Stat-Signature: rqema1cduzhupfdpnd4z7soeitwq9m7g
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18mAWqEgH6LGGdG9zFQcE5JiVDmWP40504=
X-HE-Tag: 1638510866-239568
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2021-12-02 at 18:37 -0800, Sui Chen wrote:
> This change adds a few example I2C debug counters as sysfs attributes:
> - ber_cnt (bus error count)
> - nack_cnt (NACK count)
> - rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
> - timeout_cnt (timeout count)
> - i2c_speed (bus frequency)
> - tx_complete_cnt (transaction completed, including both as an initiator
>   and as a target)
> 
> The function i2c_adapter_create_stats_folder creates a stats directory
> in the device's sysfs directory to hold the debug counters. The platform
> drivers are responsible for instantiating the counters in the stats
> directory if applicable.
[]
> diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
[]
> +void i2c_adapter_create_stats_folder(struct i2c_adapter* adapter) {
> +	adapter->stats = kzalloc(sizeof(struct i2c_adapter_stats), GFP_KERNEL);

unchecked alloc, could fail.

> +	adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);;
> +}
> +
> +void i2c_adapter_stats_register_counter(struct i2c_adapter* adapter,
> +	const char* counter_name, void* data_source) {
> +	int ret;
> +	if (adapter->stats == NULL) {
> +		i2c_adapter_create_stats_folder(adapter);
> +	}

So all of these adapter->stats dereferences could oops.

> +	if (!strcmp(counter_name, "ber_cnt")) {
> +		adapter->stats->ber_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_ber_cnt.attr);
> +	} else if (!strcmp(counter_name, "nack_cnt")) {
> +		adapter->stats->nack_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nack_cnt.attr);
> +	} else if (!strcmp(counter_name, "rec_succ_cnt")) {
> +		adapter->stats->rec_succ_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_succ_cnt.attr);
> +	} else if (!strcmp(counter_name, "rec_fail_cnt")) {
> +		adapter->stats->rec_fail_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_fail_cnt.attr);
> +	} else if (!strcmp(counter_name, "timeout_cnt")) {
> +		adapter->stats->timeout_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_timeout_cnt.attr);
> +	} else if (!strcmp(counter_name, "i2c_speed")) {
> +		adapter->stats->i2c_speed = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_i2c_speed.attr);
> +	} else if (!strcmp(counter_name, "tx_complete_cnt")) {
> +		adapter->stats->tx_complete_cnt = data_source;
> +		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_tx_complete_cnt.attr);
> +	}

and if none of the strcmp comparisons match, ret is uninitialized.

> +
> +	if (ret) {
> +		printk("Failed to create sysfs file for %s", counter_name);

pr_<level> and should have a terminating newline



