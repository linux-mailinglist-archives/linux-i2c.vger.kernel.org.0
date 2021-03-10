Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA2E3340AC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 15:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhCJOrz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 09:47:55 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:36227 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhCJOrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 09:47:24 -0500
Received: by mail-oi1-f172.google.com with SMTP id o22so9589972oic.3;
        Wed, 10 Mar 2021 06:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KR63xup1k4PJb8KNmYLKgjwXDpZ4ipRCKUM4kSkYyi8=;
        b=mM1IBmnQkBDkLEFBtvU8Okxhuo5NFDVouRDY+I7C4lTe4a5P+eObECs1hp/1hZtQDt
         5Y4bq5mslfXKaBkH7o9M96I1z9aMYAUcf6sNP+O5Fj8xDfabYa0x1oN+i3RwcFw8RawY
         Jhfo4mRKaeSDO842XEkR7mSWzwxgksJIk6lhYki7/oLzEDUgjT3qOdA6p1+3XhxU4pT7
         GSdzYTxWoXfadu1+Wfp66ZXjlqDSANlsHzz8fAYRmUOeGDldvUdmKtV9i96Xvi16cYT4
         oBOrDP8k1fL8YME5MAKd52R3tDj49bq+9ZDT80B9fytcKZLH/bIlPwKb5FD1rCVNluq0
         C+Nw==
X-Gm-Message-State: AOAM532yypi/iEfs0BINV+NgWS2EWJ7UM97w0vFU1GGGcdDPGkFAYs8t
        YXiq5cbBjZCM8lCzCAx5x6KBAtLo2cKNG9IT/NA=
X-Google-Smtp-Source: ABdhPJyEUvHcOSGifBU1dnl0FGZw93ukHd0HEV0KSaNqrrCQUZumlcUDlyyyumpEzIVheDUezqBGU35Kp6eCCEU6sho=
X-Received: by 2002:aca:3d85:: with SMTP id k127mr2693041oia.157.1615387644307;
 Wed, 10 Mar 2021 06:47:24 -0800 (PST)
MIME-Version: 1.0
References: <6660750.UgobAMfxrE@kreacher>
In-Reply-To: <6660750.UgobAMfxrE@kreacher>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 10 Mar 2021 15:47:10 +0100
Message-ID: <CAJZ5v0gCobMbDGt80exScjpGgjnbo+5kMtB6qsx1wfOf6QyiJQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 5, 2021 at 7:29 PM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> The ACPI_MODULE_NAME() definition is only used by the message
> printing macros from ACPICA that are not used by the code in
> question, so it is redundant.  Drop it.
>
> No functional impact.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

If there are no concerns regarding this, I'll queue it up for 5.13 in
the ACPI tree, thanks!

> ---
>  drivers/i2c/busses/i2c-scmi.c |    2 --
>  1 file changed, 2 deletions(-)
>
> Index: linux-pm/drivers/i2c/busses/i2c-scmi.c
> ===================================================================
> --- linux-pm.orig/drivers/i2c/busses/i2c-scmi.c
> +++ linux-pm/drivers/i2c/busses/i2c-scmi.c
> @@ -18,8 +18,6 @@
>  /* SMBUS HID definition as supported by Microsoft Windows */
>  #define ACPI_SMBUS_MS_HID              "SMB0001"
>
> -ACPI_MODULE_NAME("smbus_cmi");
> -
>  struct smbus_methods_t {
>         char *mt_info;
>         char *mt_sbr;
>
>
>
