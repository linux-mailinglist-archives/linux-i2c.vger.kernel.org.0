Return-Path: <linux-i2c+bounces-1970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1B866BEA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 09:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 699FF1C22A5E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 08:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD421D52C;
	Mon, 26 Feb 2024 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="czpnH9x6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CZPrINJx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="czpnH9x6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CZPrINJx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1C01D524
	for <linux-i2c@vger.kernel.org>; Mon, 26 Feb 2024 08:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708935382; cv=none; b=HEWa6Ag29eumY7SxL1QJ161fhTPhcU4I6sM2GzxRgkqguZO78+vcNRQZpGThDcilLR14iuk9EgLqekt/EC+E6uY58Ui1p5afhaZvlzIHG9eFg81KusVj+H3F7uFYwnaTgsnATZXbK5cz59nLWVkhfgTq2ENJ4SQsMaO9XL7VtG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708935382; c=relaxed/simple;
	bh=2RNlqhvRzJvXupO71JICy09qhjSfjIar6HRSOjhxA7w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XP246NbTfL2iy3TAF4Wh7CEL+Mc8hJYo67y0fAiQzAnEh7TeIPsL/a4yPy2MZRWK+70J7xgR9TWLR1/rbLDqRUWhsrUq+FlxiBjtUkhR2PcZl7HSGQ4yDKYH/SSUPy4ILc0UOTeiRGIu2I6xiBoRmFtXK29J+a1D2rKWz89oBkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=czpnH9x6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CZPrINJx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=czpnH9x6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CZPrINJx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F5E322513;
	Mon, 26 Feb 2024 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708935379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThKW/cewZV567LbovOVWv4x90zwJLsIadSWfxqVQiwQ=;
	b=czpnH9x60WZJJaZKXQSTwozNBG60rlo5gImw3XnFGdHw5bMKSYhb1zvzMdXGFQL17cI8SS
	2ao2DG3ct/uuNu7UfmWAmrnaX/daXqu960BAo8+k9egxrsZqLWkDgfclgwynQz8Yaw0ddY
	AZeAL+2dTvv0L18+rtZPOvLWMEUmE+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708935379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThKW/cewZV567LbovOVWv4x90zwJLsIadSWfxqVQiwQ=;
	b=CZPrINJxY5oAFdXbxxHQwkoj9lmpu5ziKi0NrY6xTQ0izCJv3RbkOzcpauBJOdIGSkGErH
	kWVdUE1RUEYAdHCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708935379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThKW/cewZV567LbovOVWv4x90zwJLsIadSWfxqVQiwQ=;
	b=czpnH9x60WZJJaZKXQSTwozNBG60rlo5gImw3XnFGdHw5bMKSYhb1zvzMdXGFQL17cI8SS
	2ao2DG3ct/uuNu7UfmWAmrnaX/daXqu960BAo8+k9egxrsZqLWkDgfclgwynQz8Yaw0ddY
	AZeAL+2dTvv0L18+rtZPOvLWMEUmE+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708935379;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThKW/cewZV567LbovOVWv4x90zwJLsIadSWfxqVQiwQ=;
	b=CZPrINJxY5oAFdXbxxHQwkoj9lmpu5ziKi0NrY6xTQ0izCJv3RbkOzcpauBJOdIGSkGErH
	kWVdUE1RUEYAdHCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F97913A80;
	Mon, 26 Feb 2024 08:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uqtbFtJI3GXvDQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 26 Feb 2024 08:16:18 +0000
Message-ID: <53c2427ccf0d56012b51ff7517616a70a02aaa73.camel@suse.de>
Subject: Re: [PATCH] i2c: i801: Fix block process call transactions
From: Jean Delvare <jdelvare@suse.de>
To: "Zakowski, Piotr" <piotr.zakowski@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Cc: piotr.zakowski@intel.com, alexander.sverdlin@gmail.com, 
	andi.shyti@kernel.org, oren.shepon@intel.com, pawel.kozlowski@intel.com, 
	alexander.usyskin@intel.com, jakub.radtke@intel.com
Date: Mon, 26 Feb 2024 09:16:17 +0100
In-Reply-To: <635a719b-84f1-4460-b4f5-ab6327de9474@linux.intel.com>
References: <635a719b-84f1-4460-b4f5-ab6327de9474@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.25 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-0.15)[68.60%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[intel.com,gmail.com,kernel.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: *
X-Spam-Score: 1.25
X-Spam-Flag: NO

Hi Piotr,

On Wed, 2024-02-21 at 12:48 +0100, Zakowski, Piotr wrote:
> 
> I applied your change and test now passes the expectations.

Sweet, thanks for testing!

> Could I confirm with you ioctl() response convention:
> It is expected from driver to return +1 Byte (Byte Count as first byte 
> together with the actual data) in read block commands (i.e. Block Read 
> Command and Block Write - Block Read Process Call)?
> 
> For example:
> 
> Data: 0x5a 0x82 0x64 0xB9 (4 Bytes)
> Return of ioctl() call of Block Read command: 0x04 0x5a 0x82 0x64 0xB9

Yes, this is the expected return.

-- 
Jean Delvare
SUSE L3 Support

