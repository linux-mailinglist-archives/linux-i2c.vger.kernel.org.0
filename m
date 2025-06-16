Return-Path: <linux-i2c+bounces-11481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AEADAB16
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A5916C45E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 08:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75E426D4C1;
	Mon, 16 Jun 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OVM6DWUw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P6DY0zDJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OVM6DWUw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P6DY0zDJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6FD211A15
	for <linux-i2c@vger.kernel.org>; Mon, 16 Jun 2025 08:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063739; cv=none; b=OgTaOTnB3ik0qevQGqR3eVdTO/cK/UnmJC+RnlLdmnTWlHRsZFnZ/zTPe3YmyEgX3Km6qZVG5wkK5/bWmVwMI6TUybfMOemkK8o9ITYrBER/AzoVj5AGxh4vSlmQu2X6raluKe8vXvucZUsn2X/uCIJxGsSj20cC4+8SVZtruCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063739; c=relaxed/simple;
	bh=CMHmRMvlIybPgTfplY3MjJdRgM5JMp6XgJ/jU980qkg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ByRS64XhGWw2WIA54+Hwv45FBy68aq7fuJl+hYPcn5i7H1jkXY7lI03g1IN+kvpWyYtVQ78rd+44kN7u/oUYzAZ5b6RwfpzWISLmjWd5jOAjGaXDI6jV9FpQaw2G3pjkThiSnhT3p/7W/kRfKVcF5EWFdC+8iLjx0XRf7sO7Z/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OVM6DWUw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P6DY0zDJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OVM6DWUw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P6DY0zDJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4788D1F387;
	Mon, 16 Jun 2025 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750063736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHbZRanB9XFp1ak2RIkdbOzwIS6/gWxvY61QFs2vR94=;
	b=OVM6DWUwW6hjaPYrsfsbVeaoBAcM8kOiyboNeIEMEpFor/yriBwKHvBDcWcC96mA+CXzRA
	ui7h7Or/vlJr87zml2b4WCE+MnQhNU8bHjLEah52M0qooa0vmvUBE9rjnGij7do/LzsTPA
	uWmqJlX/ORUZ+M4NE4Gf8pnb0wt7zVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750063736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHbZRanB9XFp1ak2RIkdbOzwIS6/gWxvY61QFs2vR94=;
	b=P6DY0zDJXEd33jVSpsuUyM1abMmOQgHYHYg56AB9JZDzEotyd7AgXuAbFdWZwJHeIIBzeX
	W1UqgxsfxrQIR0CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750063736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHbZRanB9XFp1ak2RIkdbOzwIS6/gWxvY61QFs2vR94=;
	b=OVM6DWUwW6hjaPYrsfsbVeaoBAcM8kOiyboNeIEMEpFor/yriBwKHvBDcWcC96mA+CXzRA
	ui7h7Or/vlJr87zml2b4WCE+MnQhNU8bHjLEah52M0qooa0vmvUBE9rjnGij7do/LzsTPA
	uWmqJlX/ORUZ+M4NE4Gf8pnb0wt7zVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750063736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nHbZRanB9XFp1ak2RIkdbOzwIS6/gWxvY61QFs2vR94=;
	b=P6DY0zDJXEd33jVSpsuUyM1abMmOQgHYHYg56AB9JZDzEotyd7AgXuAbFdWZwJHeIIBzeX
	W1UqgxsfxrQIR0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05485139E2;
	Mon, 16 Jun 2025 08:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mI3FOnfaT2i5QAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 16 Jun 2025 08:48:55 +0000
Date: Mon, 16 Jun 2025 10:48:55 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Alex Guo <alexguo1023@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix out-of-bounds bug in
 i801_block_transaction _byte_by_byte
Message-ID: <20250616104855.06859f8e@endymion>
In-Reply-To: <20250615233306.498536-1-alexguo1023@gmail.com>
References: <20250615233306.498536-1-alexguo1023@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

Hi Alex,

On Sun, 15 Jun 2025 19:33:06 -0400, Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.
> 
> Fix this bug by checking the value of data->block[0] first.

The same check is already present in i801_smbus_block_transaction() and
i801_i2c_block_transaction(), which are the only 2 functions calling
i801_block_transaction_byte_by_byte(). So the out-of-bounds bug you
describe does not exist.

-- 
Jean Delvare
SUSE L3 Support

