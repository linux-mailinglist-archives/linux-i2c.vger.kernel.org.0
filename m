Return-Path: <linux-i2c+bounces-13048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E2B84F42
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 16:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC44517011D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 14:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E6721FF23;
	Thu, 18 Sep 2025 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m2p52wTM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJqlIxdR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m2p52wTM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xJqlIxdR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49207212566
	for <linux-i2c@vger.kernel.org>; Thu, 18 Sep 2025 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204238; cv=none; b=hz8FHQ2q17FdzPGHNZp79UaYM27hzNFYATMwMwYkhiJE6eqq1u9vfX7jQwP5A8UepY+gKQo4QgCXsL7EeZHQgYG6qyprTROLRlqz4JXL3tmlqOkE19GPuj4lgS1ZciYdq9e3F2a6b5rxUFpdnvolBOgCi7yLSPkli/JFhn5/I6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204238; c=relaxed/simple;
	bh=fJcvxDsFfDJ7DOcdAW5T4RhS/QFMy3vf5VTwyBwSOuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jZ7g5uSvMa6TK0D9hHRZ6J/hwFQP+PMQl3vvnJHNn/4kek2kiqBDi5F/+h83eKHqpGulVBerkvPbtBGTmYvXyRawsCqeRfjpkQKYv5B51sR2okvHUC1WGWO/4V816j9hAKB5H2VcIyp71uAmGDlQDwdAgcoR/3W1nTR80AH2cUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m2p52wTM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJqlIxdR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m2p52wTM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xJqlIxdR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D8BF1F7A1;
	Thu, 18 Sep 2025 14:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Td3O5zDSfNClEV3lDFOAFNd6LeiROXb+NpVf/uh+KTA=;
	b=m2p52wTM1/uOZSf0AzFOV+Dx+wP1nb+KIOJzbhksCIC/vwcqp8DYRHq7uyOYfECq5DnKtk
	k4Gcd+jph8Ct4+1ZTppBtAc+2W5TSU84QqkskEJH0B3aYC79PSxyjOi0TXj2bMFzE8exnG
	EbQY6gZvZWpUlPJI0cbIyXEe7Cgo8/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Td3O5zDSfNClEV3lDFOAFNd6LeiROXb+NpVf/uh+KTA=;
	b=xJqlIxdRys/t3lgeAMRcZNvedHIsHjGvXDFHXtoma+Y78dssh0/M6POEeM34sq0cgdyKhO
	htQ1Slod9CMC2gAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758204232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Td3O5zDSfNClEV3lDFOAFNd6LeiROXb+NpVf/uh+KTA=;
	b=m2p52wTM1/uOZSf0AzFOV+Dx+wP1nb+KIOJzbhksCIC/vwcqp8DYRHq7uyOYfECq5DnKtk
	k4Gcd+jph8Ct4+1ZTppBtAc+2W5TSU84QqkskEJH0B3aYC79PSxyjOi0TXj2bMFzE8exnG
	EbQY6gZvZWpUlPJI0cbIyXEe7Cgo8/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758204232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Td3O5zDSfNClEV3lDFOAFNd6LeiROXb+NpVf/uh+KTA=;
	b=xJqlIxdRys/t3lgeAMRcZNvedHIsHjGvXDFHXtoma+Y78dssh0/M6POEeM34sq0cgdyKhO
	htQ1Slod9CMC2gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE12413A51;
	Thu, 18 Sep 2025 14:03:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Us1HMEcRzGhrPAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Thu, 18 Sep 2025 14:03:51 +0000
Date: Thu, 18 Sep 2025 16:03:41 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linux I2C <linux-i2c@vger.kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, Andi
 Shyti <andi.shyti@kernel.org>
Subject: [PATCH 0/3] i2c: designware: Misc small fixes
Message-ID: <20250918160341.39b66013@endymion>
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
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.80

Hi all,

While working on CVE-2025-38380, I noticed a few issues in the
i2c-designware driver, which I think are worth fixing now to make
future driver development safer and easier.

[PATCH 1/3] i2c: designware: Use msgs[0] to validate the slave address
[PATCH 2/3] i2c: designware: Extend check for mixed slave addresses
[PATCH 3/3] i2c: designware: Turn models back to enumerated values

Note that I do not own any supported device so I can't test these
changes. Even though the fixes are rather straightforward, I would
appreciate if someone can test them on actual hardware, to be on the
safe side.

Thanks,
-- 
Jean Delvare
SUSE L3 Support

