Return-Path: <linux-i2c+bounces-8923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E70A02178
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 10:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6768A7A1316
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 09:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE081D63FD;
	Mon,  6 Jan 2025 09:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qk2O8RuG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4B178362;
	Mon,  6 Jan 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154503; cv=none; b=HSH4XDUrIEeece+Ctqs8fPxYNMUNHy6mhRkghxNK6dh7Y5C1it0WajKevD2xLKXGiXToWP/XjK6rVSubtBCJBWoVQ0msI44FKVYzcW3DeEMxTs2W9tHQMq8nIy9mqcmRPQGBh8QiZsnez/+ZPfq+qaSMbHyM3DDLBFzwqPNjssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154503; c=relaxed/simple;
	bh=PgjN+2kumaqc2hc8uyyOtdC6ASxN2G/S34Ge5VoGnCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeWsizDXpRIFkbenpL14em0/0n1zp4JIFjR8LFADGDoZuoYI6zLJrFZesjyuz2baLDUod4FM7mCBy5k8/qMIE//cVKc302tDnVh4IcT7fVC488KQVHkP0SoM/JHaeVSnqPDtAksYNFVOpG087FmLoeAmrmXABlQHqu/BVOLmy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qk2O8RuG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f441904a42so20696845a91.1;
        Mon, 06 Jan 2025 01:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736154499; x=1736759299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgjN+2kumaqc2hc8uyyOtdC6ASxN2G/S34Ge5VoGnCQ=;
        b=Qk2O8RuG0fQVdiivfTgcP1zKDd2y1AaxLB/fHCjXuw6a+7iYqybOhJRziHZg7/5Q5U
         4OoAc9x3S3xetcpDrTsUI6V8G7OscDOoaG0ZKDrrsOVRTSRYPylbEimw1XghB96Rd3mo
         Jll/H02WayFtJKVj8J6/jj5clmcPXhw+j2VT6EtZ7W+krPg6cXwdauWVByvw6wo7Ym3i
         eMZ7lSMCvpc+6mhMWP5t2E69uhZ0TO5TiovqhjjrxVB9c0JIIoYUWvk4WE+mIeQqqMS1
         qUjY9n2Kb3kwBChGi+9s+dr4D57n+Yl6gAHCVakKxX9ejd4BHbbWc95AsJyO0oSUWRRG
         CddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154499; x=1736759299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgjN+2kumaqc2hc8uyyOtdC6ASxN2G/S34Ge5VoGnCQ=;
        b=jWxmN/3SVyWcsRw0QJMWO+ZaGZhCZEU9ymaMMrLYAmQlwqNJGwWx5LgSrABNvxw2cm
         6BFOmeMW2JAty+1H5W344j9kxJNLB48WHJVoc/30TZLkBR2NICf6SkGWFgDayEOkWJt0
         U0p8ADngBlWh/AbKrui66QMZpSSuuFIlCpWR11CadxqSzMKAQknLQqkUIEQ1YlLOqCSn
         QiZz+Q/CqSRE3NalPBVWpRfUPZ6OTyNYS38pkier9iAVnC7C+g0NzNnJovzwYhYHsPZX
         PbFE+V12EPLQ38e60zAmSU2xoKJIO3iIYQt0r3tuVbW0jlHYU1XDDryObRkTHxMxS8rp
         tZPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxsepE55HvubZyVaP0o/9KEbWT/UTH2a0MkpW2syoPu09+UlBeJD0Wi400bFkqtVLqdEYdQrfXpy0W@vger.kernel.org, AJvYcCWOHEoCI+IsuzpYAj9T4ojn68OcinZ59tMYp83ZjuDwkndNd7hyEngoJib5KYxw9HNwnvSQE737pDCk@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2oVjph0orOyppi+C71DSgH9uNu/7+nbMz7ubbV9HQj99j8pP
	YquF3uTWgtdga2olUF9Sesf7MW8+3T6bpb6WGwLoai9oWJtLtaAcJJUUwrf3vO2ItOYWcKyC3wp
	94Z4Zmi57ifcBPoVlEeW5djxUZ70=
X-Gm-Gg: ASbGncuF3NADDO2FWnDxrQcp77T0pgH0WNd1AHGtSjQ2hUE9gnT4qcpmLf2I9uh9uWo
	0ZDIfkxU8GszID9RE/EoQyn3quFNF8CT5bdXQGg==
X-Google-Smtp-Source: AGHT+IEcli02UzGojGojfR3dMJVAIlIErK5k58eTSxsaXy6mbL7mxS+gz/+IPPhM3qs8uPHcib/sYQj1k04rJ2K8lnI=
X-Received: by 2002:a17:90b:6cb:b0:2f2:f6e0:3f6a with SMTP id
 98e67ed59e1d1-2f452e1ea53mr82998602a91.14.1736154499543; Mon, 06 Jan 2025
 01:08:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103051657.211966-1-rha051117@gmail.com> <20250103051657.211966-2-rha051117@gmail.com>
 <20250103093353.GP3713119@black.fi.intel.com> <CACHtJB-rZ6SKF3d3xTsbJ=zQ+fPVcCcYxXLX_yMRdpE_4tyYYw@mail.gmail.com>
 <20250105083358.GU3713119@black.fi.intel.com>
In-Reply-To: <20250105083358.GU3713119@black.fi.intel.com>
From: R Ha <rha051117@gmail.com>
Date: Mon, 6 Jan 2025 03:08:08 -0600
X-Gm-Features: AbW1kvZibhZMSGtOUeKGWbufUGmumLZGNKeZ4l1u8iU0BKAOJjrgSlXMOjgQoYU
Message-ID: <CACHtJB9=7S0A0-C2vHOUaO21otDiVbUm1a-rft3GwWVyUcdh3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] Force ELAN06FA touchpad I2C bus freq to 100KHz
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 2:34=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I would expect this works in Windows? Have you
> checked if it uses 100 kHz or 400kHz there?

The touchpad does work in Windows. I couldn't find a way to check the
frequency there. I think that I need to do some more investigation
into how I can find the "proper" frequency, though if anyone has any
tips I would appreciate them greatly.

In Windows, my touchpad does not have a vendor-provided driver, but
uses the default I2C HID driver provided by Microsoft.
Actually, my touchpad is registered as two devices: An "I2C HID
Device" using the default "HIDI2C.inf" driver, and an "HID-compliant
touch pad", using the default "input.inf" driver. Both were provided
by Microsoft, so it appears there is no vendor-specific firmware here.

I initially assumed that the driver would default to 100KHz (as being
the lowest speed defined in
drivers/i2c/busses/i2c-designware-common.c), but after reading
Microsoft's documentation for I2C HID devices it appears that they
recommend 400KHz or more [1].
After reading this, I tried forcing the speed to 1MHz in the kernel,
which surprisingly also alleviated the laggy behavior. So it appears
that the speed can be either 100KHz or 1MHz, but I think that in
Windows it should be whatever the "default" defined by the Windows
driver is.

I tried finding the I2C frequency using the steps defined in the
Microsoft guide to tracing I2C HID events using Logman [2], and this
was (what I believe to be) the relevant snippet for setting up the I2C
device, though it does not appear there is anything related to the
controller frequency:
[1]0004.0140::01/06/2025-02:34:21.359
[hidi2c][WDFDEVICE:0x000018796F20AFD8] Received WDFREQUEST
0x000018797575D918 (IOCTL_HID_READ_REPORT) on WDFQUEUE
0x000018796F20AC08
[1]0004.0140::01/06/2025-02:34:21.368
[hidi2c][WDFDEVICE:0x000018796F20AFD8] Error retrieving read
WDFREQUEST 0x0000000000000000 from ReportQueue on interrupt
status:0x8000001a(STATUS_NO_MORE_ENTRIES)
[3]0004.3184::01/06/2025-02:34:21.369
[hidi2c][WDFDEVICE:0x000018796F20AFD8] D0Exit to target state D4
[0]0004.3184::01/06/2025-02:34:21.369
[hidi2c][WDFDEVICE:0x000018796F20AFD8] Power command (opcode:0x801)
sent to device register 0x5
[0]0004.3184::01/06/2025-02:34:21.369
[hidi2c][WDFDEVICE:0x000018796F20AFD8] Successfully put device into
sleep power state
[0]0004.3184::01/06/2025-02:34:21.369
[hidi2c][WDFDEVICE:0x000018796F20AFD8] Deinitialized device HID state
[0]0004.3184::01/06/2025-02:34:21.369
[hidi2c][WDFDEVICE:0x000018796F20AFD8] WdfObjectDelete closed and
deleted SpbIoTarget
[1]0004.0150::01/06/2025-02:34:23.172 [hidi2c]Created WDF driver
object:0xFFFFE78696EE0E30
[3]0004.0150::01/06/2025-02:34:23.180
[hidi2c][WDFDEVICE:0x00001879716173C8] Created new device
[1]0004.2364::01/06/2025-02:34:23.183
[hidi2c][WDFDEVICE:0x00001879716173C8] I2C resource found at index 0
with connection id: 0x1
[1]0004.2364::01/06/2025-02:34:23.183
[hidi2c][WDFDEVICE:0x00001879716173C8] Interrupt resource found at
index 1
[1]0004.2364::01/06/2025-02:34:23.183
[hidi2c][WDFDEVICE:0x00001879716173C8] Created Spb IO Target and
resources
[1]0004.2364::01/06/2025-02:34:23.184
[hidi2c][WDFDEVICE:0x00001879716173C8] Found supported DSM function:1
[1]0004.2364::01/06/2025-02:34:23.184
[hidi2c][WDFDEVICE:0x00001879716173C8] HID Descriptor register address
0x1 retrieved from ACPI
[1]0004.2364::01/06/2025-02:34:23.184
[hidi2c][WDFDEVICE:0x00001879716173C8] D0Entry from from previous
state D4
[1]0004.2364::01/06/2025-02:34:23.185
[hidi2c][WDFDEVICE:0x00001879716173C8] HID descriptor retrieved from
register 0x1 : LEN 30 VER 0x100 VID 0x4f3 PID 0x32b9 VER 0x4 RDL 679
RDA 0x2 IRA 0x3 IRML 31 ORA 0x4 ORML 0 CRA 0x5 DRA 0x6
[1]0004.2364::01/06/2025-02:34:23.185
[hidi2c][WDFDEVICE:0x00001879716173C8] Initialized device HID state
[3]0004.2364::01/06/2025-02:34:23.185
[hidi2c][WDFDEVICE:0x00001879716173C8] Power command (opcode:0x800)
sent to device register 0x5
[3]0004.2364::01/06/2025-02:34:23.185
[hidi2c][WDFDEVICE:0x00001879716173C8] Successfully put device into on
power state
[3]0004.2364::01/06/2025-02:34:23.185
[hidi2c][WDFDEVICE:0x00001879716173C8] WdfIoQueueRetrieveNextRequest
failed to find idle notification request in IdleQueue WDFQUEUE
0x000018796F1CCFD8 status:0x8000001a(STATUS_NO_MORE_ENTRIES)
[1]0004.2364::01/06/2025-02:34:23.186
[hidi2c][WDFDEVICE:0x00001879716173C8] Failed querying registry value
for DoNotWaitForResetResponsestatus:0xc0000034(STATUS_OBJECT_NAME_NOT_FOUND=
)
[1]0004.2364::01/06/2025-02:34:23.186
[hidi2c][WDFDEVICE:0x00001879716173C8] Starting timer for reset
response - IO queue stopped
[1]0004.2364::01/06/2025-02:34:23.186
[hidi2c][WDFDEVICE:0x00001879716173C8] Reset command sent to device
register 0x5
[0]0004.0140::01/06/2025-02:34:23.188
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_DEVICE_DESCRIPTOR) on WDFQUEUE
0x000018796258EA28
[0]0004.0140::01/06/2025-02:34:23.188
[hidi2c][WDFDEVICE:0x00001879716173C8] Returning device descriptor to
hidclass, report descriptor length 679
[0]0004.0140::01/06/2025-02:34:23.188
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_DEVICE_DESCRIPTOR) with
STATUS_SUCCESS
[0]0004.0140::01/06/2025-02:34:23.188
[hidi2c][WDFDEVICE:0x00001879716173C8] Received reset response -
starting IO queue
[3]0004.0150::01/06/2025-02:34:23.189
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_DEVICE_ATTRIBUTES) on WDFQUEUE
0x000018796258EA28
[3]0004.0150::01/06/2025-02:34:23.189
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_DEVICE_ATTRIBUTES) with
STATUS_SUCCESS
[3]0004.0150::01/06/2025-02:34:23.189
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_REPORT_DESCRIPTOR) on WDFQUEUE
0x000018796258EA28
[3]0004.0150::01/06/2025-02:34:23.209
[hidi2c][WDFDEVICE:0x00001879716173C8] Report descriptor of length 679
retrieved from register 0x2
[3]0004.0150::01/06/2025-02:34:23.209
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_GET_REPORT_DESCRIPTOR) with
STATUS_SUCCESS
[3]0004.0150::01/06/2025-02:34:23.209
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC4C48 (IOCTL_HID_READ_REPORT) on WDFQUEUE
0x000018796258EA28
[3]0004.0150::01/06/2025-02:34:23.209
[hidi2c][WDFDEVICE:0x00001879716173C8] Received first ping pong read -
enabling interrupt processing
[3]0004.0150::01/06/2025-02:34:23.209
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC48C8 (IOCTL_HID_READ_REPORT) on WDFQUEUE
0x000018796258EA28
[2]0790.0A3C::01/06/2025-02:34:23.225
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_STRING) on WDFQUEUE
0x000018796258EA28
[2]0790.0A3C::01/06/2025-02:34:23.225
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_STRING) with STATUS_SUCCESS
[2]0790.0A3C::01/06/2025-02:34:23.225
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_FEATURE) on WDFQUEUE
0x000018796258EA28
[0]0790.0A3C::01/06/2025-02:34:23.233
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_FEATURE) with STATUS_SUCCESS
[0]0790.0A3C::01/06/2025-02:34:23.234
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_FEATURE) on WDFQUEUE
0x000018796258EA28
[2]0790.0A3C::01/06/2025-02:34:23.242
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_GET_FEATURE) with STATUS_SUCCESS
[2]0790.0A3C::01/06/2025-02:34:23.242
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC5A48 (IOCTL_HID_DEVICERESET_NOTIFICATION) on WDFQUEUE
0x000018796258EA28
[2]0790.0A3C::01/06/2025-02:34:23.242
[hidi2c][WDFDEVICE:0x00001879716173C8] Pended device reset
notification WDFREQUEST 0x0000187962CC5A48 to WDFQUEUE
0x0000187967F9EB08
[8]0004.020C::01/06/2025-02:34:23.243
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC3208 (IOCTL_HID_SET_FEATURE) on WDFQUEUE
0x000018796258EA28
[0]0004.0300::01/06/2025-02:34:23.243
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC1608 (IOCTL_HID_SET_FEATURE) on WDFQUEUE
0x000018796258EA28
[2]0004.020C::01/06/2025-02:34:23.244
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC3208 (IOCTL_HID_SET_FEATURE) with STATUS_SUCCESS
[2]0004.0300::01/06/2025-02:34:23.244
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC1608 (IOCTL_HID_SET_FEATURE) with STATUS_SUCCESS
[2]0790.0A3C::01/06/2025-02:34:23.247
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC1608 (IOCTL_HID_SET_FEATURE) on WDFQUEUE
0x000018796258EA28
[8]0004.0300::01/06/2025-02:34:23.247
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC3208 (IOCTL_HID_SET_FEATURE) on WDFQUEUE
0x000018796258EA28
[9]0004.020C::01/06/2025-02:34:23.247
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC0F08 (IOCTL_HID_SET_FEATURE) on WDFQUEUE
0x000018796258EA28
[2]0790.0A3C::01/06/2025-02:34:23.247
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC1608 (IOCTL_HID_SET_FEATURE) with STATUS_SUCCESS
[2]0004.0300::01/06/2025-02:34:23.248
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC3208 (IOCTL_HID_SET_FEATURE) with STATUS_SUCCESS
[2]0004.020C::01/06/2025-02:34:23.248
[hidi2c][WDFDEVICE:0x00001879716173C8] Completing WDFREQUEST
0x0000187962CC0F08 (IOCTL_HID_SET_FEATURE) with STATUS_SUCCESS
[3]0004.0140::01/06/2025-02:34:23.267
[hidi2c][WDFDEVICE:0x00001879716173C8] Received WDFREQUEST
0x0000187962CC0F08 (IOCTL_HID_READ_REPORT) on WDFQUEUE
0x000018796258EA28

[1]: https://learn.microsoft.com/en-us/windows-hardware/design/component-gu=
idelines/touchpad-device-bus-connectivity#acpi-table-entries
[2]: https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/event-t=
racing#using-logmanexe

