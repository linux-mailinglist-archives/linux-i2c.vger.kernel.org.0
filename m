Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6C8E430C0C
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Oct 2021 22:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242664AbhJQUoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Oct 2021 16:44:16 -0400
Received: from mx.xn--bimann-cta.de ([185.207.104.210]:37307 "EHLO
        mx.xn--bimann-cta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242454AbhJQUoQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Oct 2021 16:44:16 -0400
X-Greylist: delayed 452 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Oct 2021 16:44:15 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=dkim; bh=RD8Cpi7fgivdyLu
        s6Xf7V4g1wooyGS/VEAcS32QW6AE=; h=in-reply-to:references:subject:cc:to:
        from:date; d=xn--bimann-cta.de; b=IYTzUGHCQOP0rHdxzdamPOiiK9NXRSUSYm+f
        PVm3rwCr0WQzgxMUTUp6Z0RaFB/ud5YegLTafHpnGCGS9fHdkpGeXv5EcXAjPY4+oiSErd
        Vq1vhvZFu8iylD4JBE2ON5Rb3JfseC5BjE/3/VfOxETehfEZTLdrXv2ACcUvBb7jQ=
Received: from kallisto.localdomain (p5084cf21.dip0.t-ipconnect.de [80.132.207.33])
        by mx.xn--bimann-cta.de (OpenSMTPD) with ESMTPSA id 1a0932bc (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
        Sun, 17 Oct 2021 22:34:32 +0200 (CEST)
Date:   Sun, 17 Oct 2021 22:34:29 +0200
From:   naib@xn--bimann-cta.de
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: I2C MSFT0001 (04F3:3072) touchpad is not recognized / registered
Message-ID: <20211017203429.2lgipbvr5oxm42nx@kallisto.localdomain>
References: <20211015144714.lvp7vz7lmeku2jpj@kallisto.localdomain>
 <YWnzXWAhqYuJCE2Z@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWnzXWAhqYuJCE2Z@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for helping me.

On Fri, Oct 15, 2021 at 02:32:13PM -0700, Dmitry Torokhov wrote:
> > # The touchscreen (ok):
> > i2c_designware AMDI0010:00: using lookup tables for GPIO lookup
> > i2c_designware AMDI0010:00: No GPIO consumer scl found
> > i2c i2c-0: adapter [Synopsys DesignWare I2C adapter] registered
> > i2c i2c-0: client [ELAN238E:00] registered with bus id i2c-ELAN238E:00
> > # The touchpad (not ok):
> > i2c_designware AMDI0010:01: using lookup tables for GPIO lookup
> > i2c_designware AMDI0010:01: No GPIO consumer scl found
> > i2c i2c-1: adapter [Synopsys DesignWare I2C adapter] registered
> 
> Since we do not see I2C client being registered in the case of touchpad
> I'd start tracing drivers/i2c/i2c-core-acpi.c, functions
> i2c_acpi_add_device() and i2c_acpi_get_info() to see where the failure
> is. I guess the changes made ACPI descriptions not match with what Linux
> expects.

I have enabled tracing via kernel parameters. Solely enabling i2c_acpi_add_device and i2c_acpi_get_info generates no output. Output for "ftrace=function ftrace_filter=i2c_acpi_*" is at [1]. I have also generated a version with the option func_stack_trace enabled, but I don't think that it worked, since the output has'nt changed that much: "ftrace=function ftrace_filter=i2c_acpi_* trace_options=print-parent,trace_printk,annotate,context-info,record-cmd,overwrite,irq-info,markers,function-trace,func_stack_trace" [2]. To correlate entries I'll also supply a dmesg buffer output [3] from the same boot.

While testing with different ftrace setups I've noticed that sometimes the touchscreen is not working. Looking at dmesg output [4] there seems to be an error while probing for it. As of [5]: "The duplicate WMI GUIDs are used for the binary MOF file of a _WDG entry in the ASL". To concentrate on the trackpad and not mix things up, I'd ignore these errors for the moment.

I'll continue reading through different docs of ftrace, to generate more usable output.

[1] https://op.xn--bimann-cta.de/bug/2021-10-16_trace.txt
[2] https://op.xn--bimann-cta.de/bug/2021-10-17_trace.txt
[3] https://op.xn--bimann-cta.de/bug/2021-10-17_dmesg.txt
[4] https://op.xn--bimann-cta.de/bug/touchscreen_errors.txt
[5] https://lkml.org/lkml/2017/12/8/914
