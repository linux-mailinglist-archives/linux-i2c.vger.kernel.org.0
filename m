Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A728617F683
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgCJLmZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:42:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgCJLmY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:42:24 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0834024655;
        Tue, 10 Mar 2020 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583840544;
        bh=ZVYOvnvFPKHeHkir4oSUWf3h0dilSgiiqwGR0G+FhE8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Qv6rq5XD0BMP0FiufKGpHlVVr6EbNzeEKPcaorNY9UocgtVPnwl64A0HRbLnUTmF4
         5XcVPdXeVdgDfi+spJq4WJLlLSaaa/R9qfj8zxTR87arGMPrebZREbUbvLoeGVRbbX
         E6vJbwRSIIOGLa319Ndl/oiNDqUes/+bbKbpbDvU=
Date:   Tue, 10 Mar 2020 12:42:15 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Rishi Gupta <gupt21@gmail.com>
cc:     benjamin.tissoires@redhat.com, wsa+renesas@sang-engineering.com,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: mcp2221: add usb to i2c-smbus host bridge
In-Reply-To: <1580185137-11255-1-git-send-email-gupt21@gmail.com>
Message-ID: <nycvar.YFH.7.76.2003101241580.19500@cbobk.fhfr.pm>
References: <1580185137-11255-1-git-send-email-gupt21@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 28 Jan 2020, Rishi Gupta wrote:

> MCP2221 is a USB HID to I2C/SMbus host bridge device. This
> commit implements i2c and smbus host adapter support. 7-bit
> address and i2c multi-message transaction is also supported.

Applied; sorry this took me a bit longer to review.

-- 
Jiri Kosina
SUSE Labs

