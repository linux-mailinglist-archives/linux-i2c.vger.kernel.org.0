Return-Path: <linux-i2c+bounces-1197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB882650A
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 17:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13FA281EF3
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jan 2024 16:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF90113AE1;
	Sun,  7 Jan 2024 16:19:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABCD13ADD;
	Sun,  7 Jan 2024 16:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A20C433C8;
	Sun,  7 Jan 2024 16:19:31 +0000 (UTC)
Date: Sun, 7 Jan 2024 11:20:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Joe Perches <joe@perches.com>, Andreas
 Schwab <schwab@linux-m68k.org>, Pali =?UTF-8?B?Um9ow6Fy?=
 <pali@kernel.org>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Jean
 Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
 Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, Tom Zanussi <zanussi@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation
 of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240107112044.6702cb66@gandalf.local.home>
In-Reply-To: <20240107110917.3d6075de@gandalf.local.home>
References: <20240106160935.45487-1-hdegoede@redhat.com>
	<20240106160935.45487-3-hdegoede@redhat.com>
	<ZZl-wrHfidYJwpOk@smile.fi.intel.com>
	<20240107110917.3d6075de@gandalf.local.home>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 7 Jan 2024 11:09:17 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> 	for (i = 0; i < hist_data->attrs->n_actions; i++) {
> 		str = hist_data->attrs->action_str[i];
> 
> 		if ((len = str_has_prefix(str, "onmatch("))) {
> 			char *action_str = str + len;
> 
> 			data = onmatch_parse(tr, action_str);
> 			if (IS_ERR(data)) {
> 				ret = PTR_ERR(data);
> 				break;
> 			}
> 		} else if ((len = str_has_prefix(str, "onmax("))) {
> 			char *action_str = str + len;
> 
> 			data = track_data_parse(hist_data, action_str,
> 						HANDLER_ONMAX);
> 			if (IS_ERR(data)) {
> 				ret = PTR_ERR(data);
> 				break;
> 			}
> 		} else if ((len = str_has_prefix(str, "onchange("))) {
> 			char *action_str = str + len;
> 
> 			data = track_data_parse(hist_data, action_str,
> 						HANDLER_ONCHANGE);
> 			if (IS_ERR(data)) {
> 				ret = PTR_ERR(data);
> 				break;
> 			}

And this could possibly be consolidated to:

	for (i = 0; i < hist_data->attrs->n_actions; i++) {
		char *action_str;
		enum handler_id hid;

		ret = -EINVAL;

		str = hist_data->attrs->action_str[i];

		if ((len = str_has_prefix(str, "onmatch(")))
			hid = HANDLER_ONMATCH;
		else if ((len = str_has_prefix(str, "onmax(")))
			hid = HANDLER_ONMAX;
		else if ((len = str_has_prefix(str, "onchange(")))
			hid = HANDLER_ONCHANGE;
		else
			break;

		action_str = str + len;

		switch (hid) {
		case HANDLER_ONMATCH:
			data = onmatch_parse(tr, action_str);
			break;
		default:
			data = track_data_parse(hist_data, action_str, hid);
		}
			
		if (IS_ERR(data)) {
			ret = PTR_ERR(data);
			break;
		}

		hist_data->actions[hist_data->n_actions++] = data;
		ret = 0;
	}

I think I'll go make that change!

-- Steve

