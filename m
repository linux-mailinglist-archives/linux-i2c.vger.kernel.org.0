Return-Path: <linux-i2c+bounces-11956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6675EB09804
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 01:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A78F1897E0E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 23:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34252571B8;
	Thu, 17 Jul 2025 23:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="RieZBhPI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C6248871;
	Thu, 17 Jul 2025 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752794975; cv=pass; b=Csi32MWoUArxgPtHe0CuXsBQwn62YOFVsDWAkInLTkjJjcn7MG2oJsk2OLOqI5SJi0usr21OUnE4P1pLJjWa5m1nsxCeQQFVmRhoG+KNVNk19wZX4KTLHDkFYugRhSwxKcLiEC3NlLAsrIIgEtNNDmtpwks8ruAwIES+rSHA+Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752794975; c=relaxed/simple;
	bh=DZeq33iotwCplBbfY3UTeCCqP46RQE37PvRc1oKQ7qQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nYIrLvnPVWZxgXOOTsqSB1cT2gNvMn5L6U81ixUg0Xp21vmD/9qGiEP3bpzVIbBZBILSi5st3gSa7t2UkBt9LjItHOS8Y3hFXAf29zrdiUaufXkk43BYSuoyAMvkgevNQNHg1McHTqhfixl1Kn8W8qeDKj2MRVQY4Ae6Qj+f5a8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=RieZBhPI; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1752794955; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JjYm2+Vru3Bt9pf3BOrBxJynRVSEUBdOCAQnnpAWsSnjYYNOIkazOBSZGxJwhT14lMRfgHp82+zaeaVEmgIUPL0es/VpchR9Ju3bl90g52hiRgFntgDOeiM85OKkuqn9l3mzD/u6DbBiiPm/NE9a+M+5M/1kjOZT370tE0cbVRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752794955; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HvDZdUpV5WbDrzd2FyycIgzTMOBOo9H31V9aeiCTf80=; 
	b=koVAbV3H94UWScHq09qZcdPhwQ6rH2iDO3JmKNfHKW8FkOHPRxETJCs3m+YRi/NfHow0sDEkKRV+0hZXb/Z9mJIT5SB6tvuqJlZEpmhyzZTp20CvPmLCO6NuOsIXBWmDpH2IoBcZ1lM5w5f8iwst9eWCx/xI0ucSe44O4L4mlUw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752794955;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=HvDZdUpV5WbDrzd2FyycIgzTMOBOo9H31V9aeiCTf80=;
	b=RieZBhPI8VL4XUpV5nir++qsXTVGcHTfHWBegxJkfeLiA6x0Z4mbOq0v27BbuvlK
	+tU4/DkhImC73x50zn8sAsHK8zZUGyuRled5qDXC6OGnmWGrJOByl99vK+Ag5XffENm
	zW2BYnqPj6bGKoKqV08MgA19pRKPx6nWmq8ZEtXU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1752794953927271.55135502634243; Thu, 17 Jul 2025 16:29:13 -0700 (PDT)
Received: from  [212.73.77.104] by mail.zoho.com
	with HTTP;Thu, 17 Jul 2025 16:29:13 -0700 (PDT)
Date: Fri, 18 Jul 2025 03:29:13 +0400
From: Askar Safin <safinaskar@zohomail.com>
To: "Mario Limonciello" <superm1@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Linux i2c" <linux-i2c@vger.kernel.org>,
	"linux-acpi" <linux-acpi@vger.kernel.org>,
	"regressions" <regressions@lists.linux.dev>,
	"DellClientKernel" <Dell.Client.Kernel@dell.com>,
	"linux-gpio" <linux-gpio@vger.kernel.org>,
	"Raul E Rangel" <rrangel@chromium.org>,
	"Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
	"Werner Sembach" <wse@tuxedocomputers.com>
Message-ID: <1981ab878bb.122f8227039020.1935112937005363340@zohomail.com>
In-Reply-To: <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
References: <197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com>
 <5d7ee2bc-6595-46f1-8c8f-0c439f033407@kernel.org>
 <197af82e9e7.10ca643e5467232.6943045931834955890@zohomail.com>
 <6f42c722-cfa5-416d-8b63-730ad88e6b9d@kernel.org>
 <197bfafc23e.e6344936595425.1881540896161671378@zohomail.com> <9eac81e6-b4ee-4210-84ac-cbf7bf811130@kernel.org>
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Feedback-ID: rr080112271604c982856de098a59a030c00009f9271007d987a22c3c9d3e5e8ee71808d862f55175c6be342:zu080112273a964176b8858c250f6f14be00002c05b71f5f33ff50b4e23d9d0cdd11ef16eb04e7b7610fc334:rf0801122b800401834c36798dbafd4fbc00000e4fdcce44309af734e6aa92eacc2dd282ab10c9dfc454f7869db8e666:ZohoMail

 ---- On Mon, 30 Jun 2025 22:40:28 +0400  Mario Limonciello <superm1@kernel.org> wrote --- 
 > Looks like your interrupt 14 is ACPI device INTC1085:00.
 > 
 > Some quick searches this seems to be an Intel GPIO controller.
 > 
 > Andy,
 > 
 > Any ideas how to debug next?

So what?

I will repeat: similar bugs were already fixed here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=782eea0c89f7d071d6b56ecfa1b8b0c81164b9be
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a69982c37cd0586e6832268155349301b87f2e35
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4cb786180dfb5258ff3111181b5e4ecb1d4a297b

So we just need to add similar patch. I. e. something similar to this:

+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "ELAN0415:00@9",
+		},

Remaining question: how should I get these strings on my system? "NL5xRU" and "ELAN0415:00@9"?
--
Askar Safin
https://types.pl/@safinaskar


