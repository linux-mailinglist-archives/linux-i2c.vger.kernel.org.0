Return-Path: <linux-i2c+bounces-13610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB13BE8BB5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 15:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 433B65019F3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 13:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DDF331A67;
	Fri, 17 Oct 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b="EB9TSu0Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from manage.vyzra.com (unknown [104.128.60.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400533CEA9
	for <linux-i2c@vger.kernel.org>; Fri, 17 Oct 2025 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.128.60.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706309; cv=none; b=k+c5HxGopsUzSngR9DZxatj6WgiBryPucU5cuGemCglJ9Px3JEHAhKdBpWTfmtDMmG2wS4mOWnlXCslAnuV3/IDEAft0Q6vCACisE768uqZBBwJq4dB5vjVxeHCWco/DLqC8oGsJxTN2xRayxjVK+PK4HDVtV2Maxo6jNK4Zvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706309; c=relaxed/simple;
	bh=biLnUx9jTTyVdIbdiavoTAgEZeIqqOihfb373MH/e18=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rr+ecc4bg79Ql51DD5yNtnJaVy4fbuK3MPfP6s/XJFzPB+Aeh/oZFqM9ImMIXroNzwxV5g/oIPY0LA6jng6ooHeCUXlVTJKQgEkJ0WJCHwc2I43la9tZoY/5AFgvJUCTXFXqb6nnEx52/Ih9wbKJIciAtx5WR/7UpQF9ph82YA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org; spf=none smtp.mailfrom=manage.vyzra.com; dkim=fail (0-bit key) header.d=debtmanager.org header.i=@debtmanager.org header.b=EB9TSu0Z reason="key not found in DNS"; arc=none smtp.client-ip=104.128.60.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debtmanager.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=manage.vyzra.com
Received: from debtmanager.org (unknown [103.237.86.103])
	by manage.vyzra.com (Postfix) with ESMTPA id CC965533801F
	for <linux-i2c@vger.kernel.org>; Fri, 17 Oct 2025 07:45:32 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=debtmanager.org;
	s=DKIM2021; t=1760705133; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=Aj8bDacQlJB5qNMC5+yWWged1+K/M8YReXQkzUminbQ=;
	b=EB9TSu0ZorOgKPI+jJTdEzpHM1m9QLmgZNPH3RZE6zCpmq+NPzk/D58Ec4kFXNvB+I1Vub
	ZLdrEjmGg2gCycgRXVvOLgsiTHwPFf75XlZAE1Y20VW87+KK8bEHbrN2EjJrxhVkbIMp4a
	NUEl7QNXrTLv3+iWQzmilbOb3686MV8nx5MGbvM0ASNlE48lzjVDPls08Gcvx6kYEDnXoU
	KqKOuxUR/uzQiA4KvTeSmCIF8WlzvcQCiHoeSDoEnjZwNFXbfw8T93mOyRPi1RPF3GKKt2
	mCNbcHuPoOwiWj/5k2eZgUtB8oxGK+bYp0l5Lb3bLBw+oIV2PICbfZLta9qEzg==
Reply-To: vlad.dinu@rdslink.ro
From: "Vlad Dinu" <info@debtmanager.org>
To: linux-i2c@vger.kernel.org
Subject: *** Urgent Change ***
Date: 17 Oct 2025 05:45:32 -0700
Message-ID: <20251017054532.6B1FDBF8CB841F7E@debtmanager.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -0.10

Hello,

I am Vlad Dinu, the newly appointed Director of IMF Legal=20
Affairs, Security and Investigation. I have been given the=20
responsibility to look into all the payments that are still=20
pending and owed to fund beneficiaries / scam victims worldwide.

This action was taken because there have been issues with some=20
banks not being able to send or release money to the correct=20
beneficiary accounts. We have found out that some directors in=20
different organizations are moving pending funds to their own=20
chosen accounts instead of where they should go.

During my investigation, I discovered that an account was=20
reported to redirect your funds to a bank in Sweden.
The details of that account are provided below. I would like you=20
to confirm if you are aware of this new information, as we are=20
now planning to send the payment to the account mentioned.

NAME OF BENEFICIARY: ERIK KASPERSSON
BANK NAME: SWEDBANK AB
ADDRESS: REPSLAGAREGATAN 23A, 582 22 LINK=C3=96PING, SWEDEN
SWIFT CODE: SWEDSESS
ACCOUNT NUMBER: 84806-31282205


A payment instruction has been issued by the Department of=20
Treasury for an immediate release of your payment to the bank=20
account above without further prejudice. We cannot approve or=20
schedule payment to the 

given bank account without your confirmation. May we proceed with=20
the transfer to the Beneficiary: Erik Kaspersson, bank account in=20
Sweden?

I await your urgent response.

Mr. Vlad Dinu.

