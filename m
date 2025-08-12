Return-Path: <linux-i2c+bounces-12254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB4B237C8
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 21:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602FA6E59F3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Aug 2025 19:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CEE260583;
	Tue, 12 Aug 2025 19:15:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BB1F429C;
	Tue, 12 Aug 2025 19:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755026142; cv=none; b=F69Iq5GBvKpQmuN/6LJLFRD+FJX5+Z5Uszv+YGTul3zu8rFCukig1HA8GXCqauAbsYzsksW7kVWLRvfzvy43dkffPpv26K4FFV/RepIakhGE+WXTg6hjmhVHPw8rFQQhrOgyHvbtuKbBRYNMClOF7tplRNX8jF1jgA0owIsA4xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755026142; c=relaxed/simple;
	bh=zjQ4QyyjPyJnsHkbXRZq/81hEBfSo+z5S3jf8UJzDL0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ROPY260ZzyOsa8t0t+CuEgDccfoForD5rG2vjb/+GuohYSkRolhhRjnGRDeju5gR57Ri5aPjr/5uk+r5A2DbQn0WVD6c2Wy/rgjq9t4mPMFnL/+X0ZNssoq1K/eQYeodj5DnC/pziKLUDmRtbI27sQ2Yy2oJqEDjQVJs01bo5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 07DCB135DB9;
	Tue, 12 Aug 2025 19:15:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id BA79C20017;
	Tue, 12 Aug 2025 19:15:27 +0000 (UTC)
Date: Tue, 12 Aug 2025 15:16:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mohammad Gomaa <midomaxgomaa@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, kenalba@google.com,
 hbarnor@chromium.org, rayxu@google.com
Subject: Re: [PATCH WIP] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <20250812151613.437e3fe8@gandalf.local.home>
In-Reply-To: <20250806-refactor-add-i2c-tracepoints-v1-1-d1d39bd6fb57@gmail.com>
References: <20250806-refactor-add-i2c-tracepoints-v1-1-d1d39bd6fb57@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 789kn6izd6ny47db4kyxobf6nersdq1j
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: BA79C20017
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/nW8qEcwhOC5ykhkpUTvbEoWZSAZ3+WKU=
X-HE-Tag: 1755026127-361825
X-HE-Meta: U2FsdGVkX1/mJKqzqqtX0y+mAW0ekKMqv6yXJpgRZPWnFlCBamGFat86x+NR05YLVJI8jCZ71dT4PZsL3AqVdQ4blXYdQYBVtXBSn3XPtcJjhfX5qNqMLa5cq9sxrGpiP4R21TdtFl4EyamW56bMWeWFSVn78Y4jMSbrT0p0IhPwzEVRvP8lT4agunREpj2zjbIiNQHbCoxcZZKGq4XYUDG+b+LH7GGTGO690qoLLkkV/ly3EQN6WHtFY63mdFgvQtambF7NuZQVQLsPyNVH4XUvWlRJ82PZKMk2W4bfrqhAwinUxvKn4p3IZw8TrUd3J1aLoMMyilpPlxZgwIAL98eWgAtssCGP

On Wed, 06 Aug 2025 12:14:32 +0300
Mohammad Gomaa <midomaxgomaa@gmail.com> wrote:

> @@ -509,38 +511,54 @@ static int i2c_device_probe(struct device *dev)
>  			/* Keep adapter active when Host Notify is
> required */ pm_runtime_get_sync(&client->adapter->dev);
>  			irq = i2c_smbus_host_notify_to_irq(client);
> +			reason = "IRQ 0: could not get irq from Host
> Notify"; } else if (is_of_node(fwnode)) {
>  			irq = fwnode_irq_get_byname(fwnode, "irq");
>  			if (irq == -EINVAL || irq == -ENODATA)
>  				irq = fwnode_irq_get(fwnode, 0);
> +			reason = "IRQ 0: could not get irq from OF";

Instead of using strings, can't you use enums?

>  		} else if (is_acpi_device_node(fwnode)) {
>  			bool wake_capable;
>  
>  			irq = i2c_acpi_get_irq(client, &wake_capable);
>  			if (irq > 0 && wake_capable)
>  				client->flags |= I2C_CLIENT_WAKE;
> +			reason = "IRQ 0: could not get irq from ACPI";
>  		}
>  		if (irq == -EPROBE_DEFER) {
>  			status = dev_err_probe(dev, irq, "can't get
> irq\n");
> +			reason = "IRQ 0: could not get IRQ due to
> EPROBE_DEFER"; goto put_sync_adapter;
>  		}
>  
> -		if (irq < 0)
> +		if (irq < 0) {
> +			trace_i2c_device_probe_debug(dev, reason);
>  			irq = 0;
> +		}
>  
>  		client->irq = irq;
>  	}
>  
>  	driver = to_i2c_driver(dev->driver);
>  
> +	has_id_table = driver->id_table;
> +	has_acpi_match = acpi_driver_match_device(dev, dev->driver);
> +	has_of_match = i2c_of_match_device(dev->driver->of_match_table,
> client); +
> +	if (!has_id_table)
> +		trace_i2c_device_probe_debug(dev, "no I2C ID table");
> +	if (!has_acpi_match)
> +		trace_i2c_device_probe_debug(dev, "ACPI ID table
> mismatch");
> +	if (!has_of_match)
> +		trace_i2c_device_probe_debug(dev, "OF ID table
> mismatch"); +
>  	/*
>  	 * An I2C ID table is not mandatory, if and only if, a suitable
> OF
>  	 * or ACPI ID table is supplied for the probing device.
>  	 */
> -	if (!driver->id_table &&
> -	    !acpi_driver_match_device(dev, dev->driver) &&
> -	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
> +	if (!has_id_table && !has_acpi_match && !has_of_match) {
>  		status = -ENODEV;
> +		reason = "no I2C ID table and no ACPI/OF match";
>  		goto put_sync_adapter;
>  	}
>  
> @@ -550,47 +568,60 @@ static int i2c_device_probe(struct device *dev)
>  		wakeirq = fwnode_irq_get_byname(fwnode, "wakeup");
>  		if (wakeirq == -EPROBE_DEFER) {
>  			status = dev_err_probe(dev, wakeirq, "can't get
> wakeirq\n");
> +			reason = "get wake IRQ due to EPROBE_DEFER";
>  			goto put_sync_adapter;
>  		}
>  
>  		device_init_wakeup(&client->dev, true);
>  
> -		if (wakeirq > 0 && wakeirq != client->irq)
> +		if (wakeirq > 0 && wakeirq != client->irq) {
>  			status = dev_pm_set_dedicated_wake_irq(dev,
> wakeirq);
> -		else if (client->irq > 0)
> +			reason = "failed to set dedicated wakeup IRQ";
> +		} else if (client->irq > 0) {
>  			status = dev_pm_set_wake_irq(dev, client->irq);
> -		else
> +			reason = "failed to set wakeup IRQ";
> +		} else {
>  			status = 0;
> +			reason = "no IRQ";
> +		}
>  
> -		if (status)
> +		if (status) {
>  			dev_warn(&client->dev, "failed to set up wakeup
> irq\n");
> +			trace_i2c_device_probe_debug(&client->dev,
> reason);
> +		}
>  	}
>  
>  	dev_dbg(dev, "probe\n");
>  
>  	status = of_clk_set_defaults(to_of_node(fwnode), false);
> -	if (status < 0)
> +	if (status < 0) {
> +		reason = "set default clocks";
>  		goto err_clear_wakeup_irq;
> -
> +	}
>  	do_power_on = !i2c_acpi_waive_d0_probe(dev);
>  	status = dev_pm_domain_attach(&client->dev, do_power_on ?
> PD_FLAG_ATTACH_POWER_ON : 0);
> -	if (status)
> +	if (status) {
> +		reason = "attach PM domain";
>  		goto err_clear_wakeup_irq;
> -
> +	}
>  	client->devres_group_id = devres_open_group(&client->dev, NULL,
>  						    GFP_KERNEL);
>  	if (!client->devres_group_id) {
>  		status = -ENOMEM;
> +		reason = "open devres group";
>  		goto err_detach_pm_domain;
>  	}
>  
>  	client->debugfs = debugfs_create_dir(dev_name(&client->dev),
>  					     client->adapter->debugfs);
>  
> -	if (driver->probe)
> +	if (driver->probe) {
>  		status = driver->probe(client);
> -	else
> +		reason = "specific driver probe failed";
> +	} else {
>  		status = -EINVAL;
> +		reason = "no probe defined";
> +	}
>  
>  	/*
>  	 * Note that we are not closing the devres group opened above so
> @@ -617,6 +648,8 @@ static int i2c_device_probe(struct device *dev)
>  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
>  		pm_runtime_put_sync(&client->adapter->dev);
>  
> +	trace_i2c_device_probe_failed(&client->dev, status, reason);
> +
>  	return status;
>  }
>  
> diff --git a/include/trace/events/i2c.h b/include/trace/events/i2c.h
> index
> 142a23c6593c611de9abc2a89a146b95550b23cd..1a08800dcdd760e2a5a40b76c4a244e1b4ef3b1e
> 100644 --- a/include/trace/events/i2c.h +++ b/include/trace/events/i2c.h
> @@ -16,6 +16,29 @@
>  /*
>   * drivers/i2c/i2c-core-base.c
>   */
> +TRACE_EVENT(i2c_device_probe_debug,
> +	    TP_PROTO(struct device *dev, const char *message),
> +	    TP_ARGS(dev, message),
> +	    TP_STRUCT__entry(__string(devname, dev_name(dev))
> __string(message, message)),
> +	    TP_fast_assign(__assign_str(devname);
> __assign_str(message);),
> +	    TP_printk("device=%s: %s", __get_str(devname),
> __get_str(message)) +);
> +
> +TRACE_EVENT(i2c_device_probe_failed,
> +	    TP_PROTO(struct device *dev, int status, const char *reason),
> +	    TP_ARGS(dev, status, reason),
> +	    TP_STRUCT__entry(__string(dev_name, dev_name(dev))
> +			     __field(int, status)
> +			     __string(reason, reason)),
> +	    TP_fast_assign(__assign_str(dev_name);
> +		__entry->status = status;
> +		__assign_str(reason);),
> +	    TP_printk("failed to probe %s: %d (%s)",
> +		      __get_str(dev_name),
> +		      __entry->status,
> +		      __get_str(reason))
> +);

Note, TRACE_EVENT() macros have their own space formatting, as they are not
normal macros and instead are to emulate code. That is, TP_STRUCT__entry is
supposed to look like a structure, and the TP_fast_assign should look like
a function. The above should look like:


TRACE_EVENT(i2c_device_probe_debug,

	TP_PROTO(struct device *dev, const char *message),

	TP_ARGS(dev, message),

	TP_STRUCT__entry(
		__string(	devname,	dev_name(dev)	)
		__string(	message,	message		)
	),

	TP_fast_assign(
		__assign_str(devname);
		__assign_str(message);
	),

	TP_printk("device=%s: %s", __get_str(devname), __get_str(message))
);

TRACE_EVENT(i2c_device_probe_failed,

	TP_PROTO(struct device *dev, int status, const char *reason),

	TP_ARGS(dev, status, reason),

	TP_STRUCT__entry(
		__string(	dev_name,	dev_name(dev)	)
		__field(	int,		status		)
		__string(	reason,		reason)
	),

	TP_fast_assign(
		__assign_str(dev_name);
		__entry->status = status;
		__assign_str(reason);
	),

	TP_printk("failed to probe %s: %d (%s)",
		  __get_str(dev_name),
		  __entry->status,
		  __get_str(reason))
);

See the difference. It's much easier to read. You can look at the other
files in include/trace/events/*.h for reference.

Instead of passing in a string for "reason" (and waste time and ring buffer
size for a string) use enums and __print_symbolic()

#define I2C_TRACE_REASON						\
	EM(HOST_NOTIFY,	"IRQ 0: could not get irq from Host
Notify")	\
	EM(FROM_OF,	"IRQ 0: could not get irq from OF")
	\
	EM(FROM_ACPI,	"IRQ 0: could not get irq from ACPI")
	\
	[..]
\
	EMe(NO_PROBE,	"no probe defined")

#undef EM
#undef EMe
#define EM(a,b)	 I2C_TRACE_REASON_##a,
#define EMe(a,b) I2C_TRACE_REASON_##a

enum {
	I2C_TRACE_REASON
};

In the trace/events/i2c.h file:

#undef EM
#undef EMe
#define EM(a,b)		TRACE_DEFINE_ENUM(I2C_TRACE_REASON_##a);
#define EMe(a,b)	TRACE_DEFINE_ENUM(I2C_TRACE_REASON_##a);

I2C_TRACE_REASON

#undef EM
#undef EMe
#define EM(a,b)		{ I2C_TRACE_REASON_##a, b },
#define EMe(a,b)	{ I2C_TRACE_REASON_##a, b }

And in the TRACE_EVENT() macro:

	TP_PROTO(struct device *dev, int status, int reason),

	TP_ARGS(dev, status, reason),

	[..]
		__field(	int,	reason		)
	[..]
		__entry->reason = reason;
	[..]

	TP_printk("device=%s: %s", __get_str(devname),
		  __print_symbolic(reason, I2C_TRACE_REASON) )

And it should work nicely both in the kernel and in user space, and not
have the overhead of copying strings during execution.

Maybe this is overkill because it's just for debugging and you shouldn't
have many of these events. But I wanted to at least educate you on the use
of these macros in case you have other areas to do this with.

-- Steve


> +
>  extern int i2c_transfer_trace_reg(void);
>  extern void i2c_transfer_trace_unreg(void);
>  
> 
> ---
> base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
> change-id: 20250806-refactor-add-i2c-tracepoints-b6e2b92d4cd9
> 
> Best regards,


